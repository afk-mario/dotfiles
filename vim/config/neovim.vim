lua <<EOF
require'nvim-treesitter.configs'.setup {
ensure_installed = "maintained",
highlight = { enable = false },
indent = { enable = false }
}
EOF
