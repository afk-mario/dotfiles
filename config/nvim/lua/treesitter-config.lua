local tree = require'nvim-treesitter.configs'


tree.setup {
  ensure_installed = "maintained",
  highlight = { enable = false },
  indent = { enable = false }
}
