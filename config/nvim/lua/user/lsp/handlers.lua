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
        float = {
            source = "always",
            format = function(diagnostic)
                if diagnostic.source == 'eslint' then
                    return string.format('%s [%s]', diagnostic.message,
                    -- shows the name of the rule
                                         diagnostic.user_data.lsp.code)
                end
                return string.format('%s [%s]', diagnostic.message,
                                     diagnostic.source)
            end
        }
    }
    vim.diagnostic.config(config)
end

local function lsp_diagnostics(client)
    if client.name ~= "tsserver" then return end
    client.handlers["textDocument/publishDiagnostics"] = function() end
end

local function lsp_formatting(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            local should_exclude = vim.tbl_contains(exclude_formatting_servers,
                                                    client.name)

            return not should_exclude
        end,
        bufnr = bufnr
    })
end

local function lsp_formatting_setup(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function() lsp_formatting(bufnr) end
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
    lsp_formatting_setup(...)
    lsp_keymaps(...)
end

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then return M end

local capabilities = cmp_nvim_lsp.default_capabilities()

M.capabilities = capabilities

return M
