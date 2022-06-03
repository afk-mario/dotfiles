local M = {}

local exclude_formatting_servers = {"tsserver", "stylelint_lsp"}

M.setup = function()
    local signs = {
        {name = "DiagnosticSignError", text = ""},
        {name = "DiagnosticSignWarn", text = ""},
        {name = "DiagnosticSignHint", text = ""},
        {name = "DiagnosticSignInfo", text = ""}
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name,
                           {texthl = sign.name, text = sign.text, numhl = ""})
    end

    local config = {
        update_in_insert = false,
        virtual_text = {source = "if_many"},
        signs = {active = signs},
        float = {source = "always"}
    }
    vim.diagnostic.config(config)
end

local function lsp_diagnostics(client)
    if client.name ~= "tsserver" then return end
    client.handlers["textDocument/publishDiagnostics"] = function() end
end

local function lsp_format_setup(client, bufnr)
    -- TODO: update this when neovim 8.0 drops
    if vim.tbl_contains(exclude_formatting_servers, client.name) then
        client.resolved_capabilities.document_formatting = false
    end

    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function() vim.lsp.buf.formatting_sync() end
        })
    end
end

local function lsp_keymaps(client, bufnr)
    --
    local opts = {noremap = true, silent = true}
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>dh",
                                "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>df",
                                "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>dl",
                                "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
M.on_attach = function(...)
    lsp_diagnostics(...)
    lsp_format_setup(...)
    lsp_keymaps(...)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then return M end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
