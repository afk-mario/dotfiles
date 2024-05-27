local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


local plugins = {
  "nvim-lua/plenary.nvim",

  -- Utilities
  "junegunn/fzf",
  "junegunn/fzf.vim",
  "mbbill/undotree",

  "tpope/vim-eunuch",              -- Unix helpers
  "tpope/vim-surround",            -- Sorroundings
  "tpope/vim-repeat",              -- More . command
  "tpope/vim-abolish",             -- Better replace
  "tpope/vim-unimpaired",          -- Key mappings for [
  "tpope/vim-dispatch",            -- Run async commands in GIT
  "tpope/vim-endwise",             -- Add end after if in lua
  "tpope/vim-projectionist",       -- granular project configuration

  "wellle/targets.vim",            -- Vim plugin that provides additional text objects
  "editorconfig/editorconfig-vim", -- Editor configurations .editorconfig
  "AndrewRadev/splitjoin.vim",     -- Split onelinners with gS

  "godlygeek/tabular",             -- Align code
  "vim-scripts/BufOnly.vim",       -- Close All other buffers
  "qpkorr/vim-bufkill",            -- Keep the window layout when closing buffers
  "mjbrownie/swapit",              -- Toggle between true false
  "numToStr/Comment.nvim",

  -- VCS
  "tpope/vim-fugitive", -- Git wrapper
  "tpope/vim-rhubarb",  -- Github extension
  "lewis6991/gitsigns.nvim",

  -- Languages
  { "nvim-treesitter/nvim-treesitter",                                    build = ":TSUpdate" },
  "nvim-treesitter/playground",
  "jamespeapen/swayconfig.vim",
  "lifepillar/pgsql.vim",
  "tweekmonster/django-plus.vim",
  -- This makes JS/JSX good syntax highlight
  "yuezk/vim-js",
  "maxmellon/vim-jsx-pretty",
  "habamax/vim-godot",
  "pfeiferj/nvim-hurl",

  -- Vim UI
  "tpope/vim-flagship",   -- Statusline
  "lukas-reineke/indent-blankline.nvim",
  "gregsexton/MatchTag",  -- Highlite Matching tag
  "psliwka/vim-smoothie", -- Smooth Scroll
  -- "ellisonleao/gruvbox.nvim"
  "gruvbox-community/gruvbox",
  { "catppuccin/nvim",                                                    name = "catppuccin", priority = 1000 },

  -- LSP
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'VonHeikemen/lsp-zero.nvim',                                          branch = 'v3.x' },
  { "neovim/nvim-lspconfig" },

  -- Autocompletion
  { "hrsh7th/nvim-cmp" },         -- Required
  { "hrsh7th/cmp-nvim-lsp" },     -- Required
  { "hrsh7th/cmp-buffer" },       -- Optional
  { "hrsh7th/cmp-path" },         -- Optional
  { "saadparwaiz1/cmp_luasnip" }, -- Optional
  { "hrsh7th/cmp-nvim-lua" },     -- Optional

  -- Snippets
  { 'L3MON4D3/LuaSnip' },
  { "rafamadriz/friendly-snippets" }, -- Optional

  -- Only for prettier
  { "jose-elias-alvarez/null-ls.nvim" },

  -- DAP
  -- { 'mfussenegger/nvim-dap' },
  -- { 'rcarriga/nvim-dap-ui' },

  -- Whitebox
  { dir = "~/apps/whitebox/whitebox_v0.122.0/editor_plugins/whitebox-vim" },
}

local opts = {}

require("lazy").setup(plugins, opts)
