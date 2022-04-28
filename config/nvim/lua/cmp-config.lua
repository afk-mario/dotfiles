-- Setup nvim-cmp.
vim.opt.completeopt = {"menu", "menuone", "noselect"}
local cmp = require 'cmp'
local lspkind = require "lspkind"

lspkind.init()
require("luasnip/loaders/from_vscode").lazy_load()

cmp.setup({
    snippet = {
        expand = function(args) require('luasnip').lsp_expand(args.body) end
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-y>'] = cmp.config.disable,
        ['<C-q>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        },

        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        ['<CR>'] = function(fallback)
            if cmp.visible() then
                cmp.mapping.confirm({select = true})
            else
                fallback()
            end
        end
    }),
    sources = {
        {name = 'nvim_lsp', max_item_count = 5}, -- lsp intelicense
        {name = 'luasnip'}, -- snippets
        {name = 'buffer', keyword_length = 2}, -- buffer words
        {name = "path"}, -- path
        {name = 'nvim_lua'}
    },
    formatting = {
        format = lspkind.cmp_format {
            with_text = true,
            menu = {
                buffer = "[BUF]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[api]",
                path = "[PATH]",
                luasnip = "[SNIP]",
                gh_issues = "[ISSUE]"
            }
        }
    },
    view = {entries = 'native'},
    experimental = {ghost_text = true}
})

