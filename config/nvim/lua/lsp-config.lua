local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local nvim_lsp = require("lspconfig")
vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end

local servers = { 'pyright', 'tsserver' , 'eslint', 'cssls', 'gdscript' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup{
    capabilities = capabilities
  }
end
