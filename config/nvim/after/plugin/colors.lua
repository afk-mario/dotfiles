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
				Todo = { fg = colors.mauve, bg = colors.none },
				['@comment.todo'] = { fg = colors.mauve, bg = colors.none },
				['@comment.note'] = { fg = colors.blue, bg = colors.none },
				['@comment.warning'] = {
					fg = colors.yellow,
					bg = colors.none,
					style = { 'bold' }
				},
				['@comment.error'] = {
					fg = colors.red,
					bg = colors.none,
					style = { 'bold' }
				},
				['@markup.list.checked'] = { fg = colors.green },
				['@markup.list.unchecked'] = { fg = colors.overlay1 },
			}
		end
	}
})
vim.cmd.colorscheme 'catppuccin'

-- Treesitter comment injections lose to @comment / LSP tokens, and Vim
-- syntax only keywords TODO. Match these above both so NOTE/BUG/etc show.
local comment_keywords = {
	{ '@comment.todo', [[\C\<\(TODO\|WIP\):]] },
	{ '@comment.note', [[\C\<\(NOTE\|INFO\|XXX\|DOCS\|PERF\|TEST\):]] },
	{ '@comment.warning', [[\C\<\(HACK\|WARNING\|WARN\):]] },
	{ '@comment.error', [[\C\<\(FIXME\|BUG\|ERROR\):]] },
}

local function add_comment_keyword_matches(win)
	if vim.w[win].user_comment_keywords then
		return
	end
	local priority = vim.hl.priorities.user
	for _, item in ipairs(comment_keywords) do
		vim.fn.matchadd(item[1], item[2], priority, -1, { window = win })
	end
	vim.w[win].user_comment_keywords = true
end

vim.api.nvim_create_autocmd({ 'VimEnter', 'WinEnter' }, {
	callback = function()
		add_comment_keyword_matches(vim.api.nvim_get_current_win())
	end,
})
add_comment_keyword_matches(vim.api.nvim_get_current_win())
