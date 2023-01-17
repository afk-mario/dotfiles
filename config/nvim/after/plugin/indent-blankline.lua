require("indent_blankline").setup {
	show_current_context = true,
	show_trailing_blankline_indent = false
}

vim.cmd [[highlight IndentBlanklineChar guifg=#3c3836 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineContextChar guifg=#7c6f64 gui=nocombine]]
