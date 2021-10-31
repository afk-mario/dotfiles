-- Setup nvim-cmp.
vim.opt.completeopt = { "menu", "menuone", "noselect" }
local cmp = require'cmp'
local lspkind = require "lspkind"

lspkind.init()
require("luasnip/loaders/from_vscode").lazy_load()

cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-y>'] = cmp.config.disable,
      ['<C-q>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },

      ['<C-e>'] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
      ['<CR>'] = cmp.mapping.confirm({ select = true })
    },
    sources = {
      { name = 'nvim_lsp' , max_item_count = 5 },
      { name = 'luasnip' },

      { name = 'buffer', keyword_length = 3 },
      { name = "path" },

      { name = 'nvim_lua' },
    },
    formatting = {
      format = lspkind.cmp_format {
        with_text = true,
        menu = {
          buffer = "[buf]",
          nvim_lsp = "[LSP]",
          nvim_lua = "[api]",
          path = "[path]",
          luasnip = "[snip]",
          gh_issues = "[issues]",
        },
      },
    },
    experimental = {
      native_menu = false,
      ghost_text = true,
    }
  })

