local tree = require "nvim-treesitter.configs"
require("hurl").setup()

tree.setup {
  ensure_installed = {
    "lua",
    "javascript",
    "bash",
    "css",
    "gdscript",
    "glsl",
    "go",
    "graphql",
    "html",
    "json",
    "typescript",
    "vim",
    "hurl",
    "comment"
  },
  auto_install = true,
  sync_install = false,
  highlight = {
    enable = true,
    disable = { "javascript", "typescriptreact", "sql", "htmldjango" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = { "gdscript" }
  }
}

-- https://github.com/nvim-treesitter/nvim-treesitter#folding
vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr=nvim_treesitter#foldexpr()
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
