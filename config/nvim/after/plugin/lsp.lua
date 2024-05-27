local lsp = require('lspconfig')
local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr }
  lsp_zero.default_keymaps({ buffer = bufnr })
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
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
    "bashls",
    "yamlls"
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
          -- Disable formatting on tsserver because we use prettier
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


vim.diagnostic.config({
  virtual_text = false,
  float = {
    source = true,
  }
})
