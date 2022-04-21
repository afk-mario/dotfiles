local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp
                                                                     .protocol
                                                                     .make_client_capabilities())

local nvim_lsp = require("lspconfig")
vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end

-- local servers = {'pyright', 'tsserver', 'eslint', 'cssls'}
local servers = {'pyright', 'cssls'}

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {capabilities = capabilities}
end

nvim_lsp.ccls.setup {
    init_options = {
        compilationDatabaseDirectory = "build",
        index = {threads = 0},
        clang = {excludeArgs = {"-frounding-math"}}
    }
}

nvim_lsp.gdscript.setup {
    -- https://github.com/neovim/neovim/issues/12633
    on_attach = function(client)
        local _notify = client.notify
        client.notify = function(method, params)
            if method == 'textDocument/didClose' then return end
            _notify(method, params)
        end
    end,
    capabilities = capabilities
}
