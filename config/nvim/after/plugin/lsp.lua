local lsp = require('lsp-zero').preset({
  manage_nvim_cmp = { set_basic_mappings = true }
})

lsp.setup_servers({ "gdscript" })
lsp.ensure_installed(
  {
    "tsserver",
    "lua_ls",
    "cssls",
    "eslint",
    "stylelint_lsp",
    "ruff_lsp"
  }
)

-- Fix Undefined global for vim things
lsp.configure(
  "lua_ls",
  { settings = { Lua = { diagnostics = { globals = { "vim", "augroup" } } } } }
)

-- Disable stylelint on JSX
lsp.configure(
  "stylelint_lsp", {
    filetypes = { "css", "less", "scss", "sugarss", "vue", "wxss" },
    settings = { stylelintplus = { cssInJs = false } }
  }
)

-- Disable Tsserver diagnositcs
lsp.configure(
  "tsserver", {
    on_init = function(client)
      -- This is probably a miss config on my side but oh well
      client.handlers["textDocument/publishDiagnostics"] = function() end
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentFormattingRangeProvider = false
    end
  }
)

lsp.configure(
  "gdscript", {
    on_attach = function(client)
      local _notify = client.notify
      client.notify = function(method, params)
        if method == "textDocument/didClose" then return end
        _notify(method, params)
      end
    end,
    flags = { debounce_text_changes = 150 }
  }
)

lsp.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['lua_ls'] = { 'lua' },
    ['null-ls'] = { 'javascript', 'javascriptreact', 'typescript', 'python', 'css', 'gdscript', 'psql' },
  }
})


-- Maybe I need to enable this only on nvim configs
lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
end)
lsp.nvim_workspace()
lsp.setup()

local null_ls = require("null-ls")
local null_opts = lsp.build_options("null-ls", {})

null_ls.setup(
  {
    on_attach = function(client, bufnr)
      null_opts.on_attach(client, bufnr)
    end,
    sources = {
      -- Replace these with the tools you have installed
      null_ls.builtins.formatting.prettier.with({ prefer_local = true }),
      -- null_ls.builtins.formatting.lua_format,
      null_ls.builtins.formatting.gdformat,
      null_ls.builtins.formatting.pg_format,
      null_ls.builtins.formatting.black
    }
  }
)
