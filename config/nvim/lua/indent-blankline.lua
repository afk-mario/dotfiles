vim.cmd [[highlight IndentBlanklineContextChar guifg=#a89984 gui=nocombine]]

require("indent_blankline").setup {
    show_current_context = true,
    show_trailing_blankline_indent = false
}
