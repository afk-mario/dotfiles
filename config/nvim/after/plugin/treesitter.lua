local tree = require 'nvim-treesitter'
-- require('hurl').setup()

local languages = {
	'lua',
	'javascript',
	'bash',
	'css',
	'gdscript',
	'glsl',
	'go',
	'graphql',
	'html',
	'json',
	'typescript',
	'vim',
	'hurl',
	'comment'
}

tree.install(languages)

vim.api.nvim_create_autocmd('FileType', {
	pattern = languages,
	callback = function() vim.treesitter.start() end,
})

-- https://github.com/nvim-treesitter/nvim-treesitter#folding
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldenable = true
vim.opt.foldlevel = 99
