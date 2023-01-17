local colors = require("gruvbox.palette")
require("gruvbox").setup(
	{
		overrides = {
			SignColumn = {bg = colors.dark0},
			LineNr = {bg = colors.dark0},
			-- Placeholder while the groups are added to gruvbox
			Whitespace = {fg = colors.dark1},
			Label = {fg = colors.dark4}
		}
	}
)

-- vim.cmd [[highlight clear SignColumn]]
-- vim.cmd [[highlight clear LineNr]]
vim.cmd [[highlight VertSplit cterm=none ctermbg=none ctermfg=247]]

vim.cmd([[colorscheme gruvbox]])
