-- Convert Obsidian-style ![[image]] embeds into pandoc Images.
-- Vault-wide search only when TTRPG_VAULT_ROOT is set; otherwise note-dir only.

local IMAGE_EXT = {
  png = true,
  jpg = true,
  jpeg = true,
  gif = true,
  webp = true,
  svg = true,
  pdf = true,
}

local function file_exists(path)
  local f = io.open(path, "r")
  if f then
    f:close()
    return true
  end
  return false
end

local function cwd()
  local p = io.popen("pwd")
  local dir = p and p:read("*l") or "."
  if p then
    p:close()
  end
  return dir
end

local function note_dir()
  local input = PANDOC_STATE.input_files[1]
  if not input then
    return cwd()
  end
  local dir = pandoc.path.directory(input)
  if dir == "" then
    dir = "."
  end
  if pandoc.path.is_absolute(dir) then
    return dir
  end
  return pandoc.path.normalize(pandoc.path.join({ cwd(), dir }))
end

local function absolutize(path)
  if pandoc.path.is_absolute(path) then
    return pandoc.path.normalize(path)
  end
  return pandoc.path.normalize(pandoc.path.join({ note_dir(), path }))
end

local function vault_root()
  local root = os.getenv("TTRPG_VAULT_ROOT")
  if root and root ~= "" then
    return root
  end
  return nil
end

local function is_image_target(target)
  local _, ext = pandoc.path.split_extension(target)
  if not ext or ext == "" then
    return false
  end
  ext = ext:lower()
  if ext:sub(1, 1) == "." then
    ext = ext:sub(2)
  end
  return IMAGE_EXT[ext] == true
end

local function search_vault(basename, prefer_dir)
  local vault = vault_root()
  if not vault then
    return nil
  end
  local prefer = pandoc.path.join({ prefer_dir, basename })
  if file_exists(prefer) then
    return prefer
  end
  local cmd = string.format(
    "find %s -type f -name %s 2>/dev/null | head -n 1",
    string.format("%q", vault),
    string.format("%q", basename)
  )
  local p = io.popen(cmd)
  if not p then
    return nil
  end
  local found = p:read("*l")
  p:close()
  if found and found ~= "" and file_exists(found) then
    return found
  end
  return nil
end

local function resolve_image(target)
  if pandoc.path.is_absolute(target) then
    if file_exists(target) then
      return target
    end
    return nil
  end

  local ndir = note_dir()
  local beside = pandoc.path.join({ ndir, target })
  if file_exists(beside) then
    return absolutize(beside)
  end

  local vault = vault_root()
  if vault and target:find("/", 1, true) then
    local vault_path = pandoc.path.join({ vault, target })
    if file_exists(vault_path) then
      return absolutize(vault_path)
    end
  end

  if vault then
    local base = pandoc.path.filename(target)
    local found = search_vault(base, ndir)
    if found then
      return absolutize(found)
    end
  end

  return nil
end

-- Pure black & white (thresholded), not grayscale. Preserves alpha.
local bw_counter = 0
local function to_bw(path)
  if os.getenv("TTRPG_BW") ~= "1" then
    return path
  end
  local bw_dir = os.getenv("TTRPG_BW_DIR")
  if not bw_dir or bw_dir == "" then
    io.stderr:write("ttrpg-obsidian-images: TTRPG_BW_DIR not set; skipping B&W convert\n")
    return path
  end

  bw_counter = bw_counter + 1
  local base = pandoc.path.filename(path)
  local stem = select(1, pandoc.path.split_extension(base))
  local dest = pandoc.path.join({
    bw_dir,
    string.format("%s-%d.png", stem, bw_counter),
  })

  local cmd = string.format(
    "magick %q \\( +clone -alpha extract \\) \\( -clone 0 -alpha off -colorspace Gray -threshold 50%% \\) -delete 0 +swap -compose CopyOpacity -composite %q",
    path,
    dest
  )
  local ok = os.execute(cmd)
  if ok == true or ok == 0 then
    return dest
  end
  io.stderr:write("ttrpg-obsidian-images: B&W convert failed: " .. path .. "\n")
  return path
end

local function make_image(target, alias)
  local path = resolve_image(target)
  if not path then
    io.stderr:write("ttrpg-obsidian-images: image not found: " .. target .. "\n")
    return nil
  end
  path = to_bw(path)
  local attr = pandoc.Attr("", {}, {})
  if alias and alias:match("^%d+$") then
    attr.attributes.width = alias
  end
  return pandoc.Image({}, path, "", attr)
end

local function match_embed(text, pos)
  local s, e, target, alias = text:find("!%[%[([^]|]+)|([^]]+)%]%]", pos)
  if s then
    return s, e, target, alias
  end
  s, e, target = text:find("!%[%[([^]|]+)%]%]", pos)
  if s then
    return s, e, target, nil
  end
  return nil
end

local function expand_inlines(inlines)
  local out = pandoc.List()
  for _, el in ipairs(inlines) do
    if el.t == "Str" and el.text:find("![[", 1, true) then
      local text = el.text
      local pos = 1
      while pos <= #text do
        local s, e, target, alias = match_embed(text, pos)
        if not s then
          if pos <= #text then
            out:insert(pandoc.Str(text:sub(pos)))
          end
          break
        end
        if s > pos then
          out:insert(pandoc.Str(text:sub(pos, s - 1)))
        end
        if is_image_target(target) then
          local img = make_image(target, alias)
          if img then
            out:insert(img)
          else
            out:insert(pandoc.Str(text:sub(s, e)))
          end
        else
          out:insert(pandoc.Str(text:sub(s, e)))
        end
        pos = e + 1
      end
    else
      out:insert(el)
    end
  end
  return out
end

function Inlines(inlines)
  return expand_inlines(inlines)
end

-- Also convert normal markdown images when --bw is set.
function Image(el)
  if os.getenv("TTRPG_BW") ~= "1" then
    return nil
  end
  local src = el.src
  if not pandoc.path.is_absolute(src) then
    local resolved = resolve_image(src)
    if resolved then
      src = resolved
    else
      local beside = pandoc.path.join({ note_dir(), src })
      if file_exists(beside) then
        src = absolutize(beside)
      end
    end
  end
  if file_exists(src) then
    el.src = to_bw(src)
  end
  return el
end

-- Center standalone images in the column (no floats — multicol-safe).
function Para(el)
  if not FORMAT:match("latex") then
    return nil
  end
  local img = nil
  for _, inline in ipairs(el.content) do
    if inline.t == "Image" then
      if img ~= nil then
        return nil
      end
      img = inline
    elseif inline.t ~= "Space" and inline.t ~= "SoftBreak" then
      return nil
    end
  end
  if img == nil then
    return nil
  end
  return {
    pandoc.RawBlock("latex", "\\begin{center}"),
    pandoc.Para{ img },
    pandoc.RawBlock("latex", "\\end{center}"),
  }
end
