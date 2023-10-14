local lsp = require('lspconfig')
local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(_, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    "tsserver",
    "lua_ls",
    "cssls",
    "eslint",
    "stylelint_lsp",
    "ruff_lsp",
    "clangd",
    "emmet_language_server",
  },
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      -- IDK
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
    tsserver = function()
      lsp.tsserver.setup({
        on_init = function(client)
          -- This is probably a miss config on my side but oh well
          client.handlers["textDocument/publishDiagnostics"] = function() end
          -- Disable formatting on tsserver because we use null-ls
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentFormattingRangeProvider = false
        end
      })
    end,
    -- Disable stylelint on js
    stylelint_lsp = function()
      lsp.stylelint_lsp.setup({
        filetypes = { "css", "less", "scss", "sugarss", "vue", "wxss" },
        settings = { stylelintplus = { cssInJs = false } }
      })
    end,
  }
})

-- gdscript = function()
--   lsp.gdscript.setup({
--     on_attach = function(client)
--       local _notify = client.notify
--       client.notify = function(method, params)
--         if method == "textDocument/didClose" then return end
--         _notify(method, params)
--       end
--     end,
--     flags = { debounce_text_changes = 150 }
--   })
-- end

lsp_zero.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['lua_ls'] = { 'lua' },
    ['null-ls'] = { 'javascript', 'javascriptreact', 'typescript', 'python', 'css', 'gdscript', 'psql', 'c', 'cpp' },
  }
})


local cmp = require('cmp')
local cmp_format = lsp_zero.cmp_format()
local cmp_action = lsp_zero.cmp_action()
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'luasnip' },
    { name = 'path' },
  },
  formatting = cmp_format,
  mapping = cmp.mapping.preset.insert({
    -- scroll up and down the documentation window
    ['<C-CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
  }),
})


local null_ls = require("null-ls")
local null_opts = lsp_zero.build_options("null-ls", {})

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
      null_ls.builtins.formatting.black,
      null_ls.builtins.formatting.clang_format
    }
  }
)

vim.diagnostic.config({
  virtual_text = false
})
