-- Only required if you have packer configured as `opt`
vim.cmd.packadd("packer.nvim")

return require("packer").startup(
	function(use)
		-- Packer can manage itself
		use "wbthomason/packer.nvim"
		use "nvim-lua/plenary.nvim"

		-- Utilities
		use "junegunn/fzf"
		use "junegunn/fzf.vim"
		use "mbbill/undotree"

		use "tpope/vim-eunuch" -- Unix helpers
		use "tpope/vim-surround" -- Sorroundings
		use "tpope/vim-repeat" -- More . command
		use "tpope/vim-abolish" -- Better replace
		use "tpope/vim-unimpaired" -- Key mappings for [
		use "tpope/vim-dispatch" -- Run async commands in GIT
		use "tpope/vim-endwise" -- Add end after if in lua

		use "wellle/targets.vim" -- Vim plugin that provides additional text objects
		use "editorconfig/editorconfig-vim" -- Editor configurations .editorconfig
		use "AndrewRadev/splitjoin.vim" -- Split onelinners with gS

		-- use 'Raimondi/delimitMate'          -- Auto close quotes parentesis etc
		use "godlygeek/tabular" -- Align code
		use "vim-scripts/BufOnly.vim" -- Close All other buffers
		use "qpkorr/vim-bufkill" -- Keep the window layout when closing buffers
		use "mjbrownie/swapit" -- Toggle between true false
		use "numToStr/Comment.nvim"

		-- VCS
		use "tpope/vim-fugitive" -- Git wrapper
		use "tpope/vim-rhubarb" -- Github extension
		use "airblade/vim-gitgutter" -- Git gutter simbols

		-- Languages
		use("nvim-treesitter/nvim-treesitter", {run = ":TSUpdate"})
		use "nvim-treesitter/playground"
		use "mattn/emmet-vim"
		use "jamespeapen/swayconfig.vim"
		-- This makes JS/JSX good syntax highlight
		use "yuezk/vim-js"
		use "maxmellon/vim-jsx-pretty"

		-- Vim UI
		use "tpope/vim-flagship" -- Statusline
		use "lukas-reineke/indent-blankline.nvim"
		use "gregsexton/MatchTag" -- Highlite Matching tag
		use "psliwka/vim-smoothie" -- Smooth Scroll
		use "ellisonleao/gruvbox.nvim"

		use {
			"VonHeikemen/lsp-zero.nvim",
			requires = {
				-- LSP Support
				{"neovim/nvim-lspconfig"}, -- Required
				{"williamboman/mason.nvim"}, -- Optional
				{"williamboman/mason-lspconfig.nvim"}, -- Optional

				-- Autocompletion
				{"hrsh7th/nvim-cmp"}, -- Required
				{"hrsh7th/cmp-nvim-lsp"}, -- Required
				{"hrsh7th/cmp-buffer"}, -- Optional
				{"hrsh7th/cmp-path"}, -- Optional
				{"saadparwaiz1/cmp_luasnip"}, -- Optional
				{"hrsh7th/cmp-nvim-lua"}, -- Optional

				-- Snippets
				{"L3MON4D3/LuaSnip"}, -- Required
				{"rafamadriz/friendly-snippets"}, -- Optional

				-- Only for prettier
				{"jose-elias-alvarez/null-ls.nvim"}
			}
		}
	end
)