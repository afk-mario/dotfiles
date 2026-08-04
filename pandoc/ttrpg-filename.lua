-- Full-width header from input filename (sans extension), then two columns.
function Pandoc(doc)
  local name = ""
  local input = PANDOC_STATE.input_files[1]
  if input then
    name = select(1, pandoc.path.split_extension(pandoc.path.filename(input)))
    name = name:gsub("([\\#$%%&_{}])", "\\%1")
  end

  table.insert(
    doc.blocks,
    1,
    pandoc.RawBlock(
      "latex",
      table.concat({
        "\\renewcommand{\\ttrpgdocname}{" .. name .. "}",
        "\\begin{multicols*}{2}[{%",
        "\\centerline{\\sffamily\\fontsize{28}{34}\\selectfont\\ttrpgdocname}\\vspace{0.75em}",
        "}]",
      }, "\n")
    )
  )
  table.insert(doc.blocks, pandoc.RawBlock("latex", "\\end{multicols*}"))
  return doc
end
