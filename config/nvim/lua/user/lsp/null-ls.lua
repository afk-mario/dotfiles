local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then return end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local on_attach = require("user.lsp.handlers").on_attach

null_ls.setup({
    on_attach = on_attach,
    sources = {
        formatting.prettier.with({prefer_local = true}), formatting.lua_format,
        null_ls.builtins.diagnostics.stylelint.with({prefer_local = true})
    }
})
