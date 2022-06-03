local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then return end

local lsp_installer = require("nvim-lsp-installer")
local lsp_config = require("lspconfig")

local servers = {'pyright', 'cssls', 'tsserver', 'eslint'}

lsp_installer.setup {ensure_installed = servers}

local on_attach = require("user.lsp.handlers").on_attach
local capabilities = require("user.lsp.handlers").capabilities

local opts = {on_attach = on_attach, capabilities = capabilities}
for _, server in ipairs(servers) do lsp_config[server].setup(opts) end

-- lsp_config['stylelint_lsp'].setup({
--     on_attach = on_attach,
--     capabilities = capabilities,
--     filetypes = {"css", "less", "scss", "sugarss"}
-- })
