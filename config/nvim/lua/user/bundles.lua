vim.api.nvim_create_autocmd('PackChanged', {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == 'nvim-treesitter' and kind == 'update' then
			if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
			vim.cmd('TSUpdate')
		end
	end
})


local gh = function(x) return 'https://github.com/' .. x end


local plugins = {
	gh('nvim-lua/plenary.nvim'),

	-- Utilities
	gh('junegunn/fzf'),
	gh('junegunn/fzf.vim'),

	gh('tpope/vim-eunuch'),         -- Unix helpers
	gh('tpope/vim-surround'),       -- Sorroundings
	gh('tpope/vim-repeat'),         -- More . command
	gh('tpope/vim-abolish'),        -- Better replace
	gh('tpope/vim-unimpaired'),     -- Key mappings for [
	gh('tpope/vim-dispatch'),       -- Run async commands in GIT
	gh('tpope/vim-endwise'),        -- Add end after if in lua
	gh('tpope/vim-projectionist'),  -- granular project configuration

	gh('wellle/targets.vim'),       -- Vim plugin that provides additional text objects
	gh('AndrewRadev/splitjoin.vim'), -- Split onelinners with gS

	gh('godlygeek/tabular'),        -- Align code
	gh('vim-scripts/BufOnly.vim'),  -- Close All other buffers
	gh('qpkorr/vim-bufkill'),       -- Keep the window layout when closing buffers
	gh('numToStr/Comment.nvim'),

	-- VCS
	gh('tpope/vim-fugitive'), -- Git wrapper
	gh('tpope/vim-rhubarb'), -- Github extension
	gh('lewis6991/gitsigns.nvim'),

	-- Languages
	gh('nvim-treesitter/nvim-treesitter'),

	gh('jamespeapen/swayconfig.vim'),
	gh('lifepillar/pgsql.vim'),
	gh('tweekmonster/django-plus.vim'),
	gh('fatih/vim-go'),

	-- This makes JS/JSX good syntax highlight
	gh('yuezk/vim-js'),
	gh('maxmellon/vim-jsx-pretty'),
	gh('habamax/vim-godot'),
	gh('pfeiferj/nvim-hurl'),

	-- Vim UI
	gh('tpope/vim-flagship'),  -- Statusline
	gh('lukas-reineke/indent-blankline.nvim'),
	gh('gregsexton/MatchTag'), -- Highlite Matching tag
	gh('psliwka/vim-smoothie'), -- Smooth Scroll

	-- "ellisonleao/gruvbox.nvim"
	gh('gruvbox-community/gruvbox'),
	gh('catppuccin/nvim'),

	-- LSP
	gh('williamboman/mason.nvim'),
	gh('williamboman/mason-lspconfig.nvim'),
	gh('neovim/nvim-lspconfig'),

	-- Autocompletion
	gh('hrsh7th/nvim-cmp'),
	gh('hrsh7th/cmp-nvim-lsp'),
	gh('hrsh7th/cmp-buffer'),
	gh('hrsh7th/cmp-path'),
	gh('saadparwaiz1/cmp_luasnip'),
	gh('hrsh7th/cmp-nvim-lua'),

	-- Snippets
	gh('L3MON4D3/LuaSnip'),
	gh('rafamadriz/friendly-snippets'),

	-- Only for prettier
	gh('stevearc/conform.nvim'),

	-- DAP
	-- { 'mfussenegger/nvim-dap' },
	-- { 'rcarriga/nvim-dap-ui' },

	-- Whitebox
	-- {
	-- 	dir =
	-- 	'~/apps/whitebox/whitebox_v0.122.0/editor_plugins/whitebox-vim'
	-- },
}


vim.cmd('packadd nvim.undotree')
vim.pack.add(plugins)
