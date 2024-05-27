-- OLD setup for gruvbox.nvim
-- local colors = require("gruvbox.palette")
-- require("gruvbox").setup(
-- 	{
-- 		overrides = {
-- 			SignColumn = {bg = colors.dark0},
-- 			LineNr = {bg = colors.dark0},
-- 			-- Placeholder while the groups are added to gruvbox
-- 			Whitespace = {fg = colors.dark1},
-- 			Label = {fg = colors.dark4}
-- 		}
-- 	}
-- )
-- SignColumn should match background
-- vim.cmd [[highlight clear SignColumn]]
-- Current line number row will have same background color in relative mode
-- vim.cmd [[highlight clear LineNr]]
-- vim.cmd [[highlight Whitespace guifg=#3c3836 gui=nocombine]]
-- vim.cmd [[highlight Label guifg=#7c6f64 gui=nocombine]]
-- vim.cmd [[highlight VertSplit cterm=none ctermbg=none ctermfg=247]]
-- SignColumn should match background
-- vim.g.gruvbox_sign_column = "bg0"
-- vim.cmd([[colorscheme gruvbox]])
require('catppuccin').setup({
	highlight_overrides = {
		all = function(colors)
			return {
				['@text.todo'] = { fg = colors.yellow, bg = colors.none },
				['@text.todo.checked'] = { fg = colors.green },
				['@text.todo.unchecked'] = { fg = colors.overlay1 },
				['@text.note'] = { fg = colors.blue, bg = colors.none },
				['@text.warning'] = {
					fg = colors.yellow,
					bg = colors.none,
					style = { 'bold' }
				},
				['@text.danger'] = {
					fg = colors.red,
					bg = colors.none,
					style = { 'bold' }
				},
			}
		end
	}
})
vim.cmd.colorscheme 'catppuccin'
