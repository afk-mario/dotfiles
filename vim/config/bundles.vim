" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:

"i3config Notes {
" Personal vimrc of Mario Carballo Zama
" [afk] https://ellugar.co
" This shoould handle all bundle installations
" }

let g:polyglot_disabled = ['i3config', 'swayconfig', 'gdscript', 'jsonc']

" Config {
" if empty(glob("${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim"))
"   silent !curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim" --create-dirs
"               \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif

call plug#begin('~/.vim/plugged')
" }

" Utilities{
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-sensible'            " Sensible defaults
Plug 'tpope/vim-vinegar'             " Netrw helper
Plug 'tpope/vim-eunuch'              " Unix helpers
Plug 'tpope/vim-commentary'          " Toggle comments
Plug 'tpope/vim-surround'            " Sorroundings
Plug 'tpope/vim-repeat'              " More . command
Plug 'tpope/vim-abolish'             " Better replace
Plug 'tpope/vim-unimpaired'          " Key mappings for [
Plug 'tpope/vim-dispatch'            " Run async commands in GIT
Plug 'tpope/vim-endwise'             " Add end after if in lua

" Plug 'suy/vim-context-commentstring' " Context commentstring for JSX

Plug 'wellle/targets.vim'            " Vim plugin that provides additional text objects
Plug 'editorconfig/editorconfig-vim' " Editor configurations .editorconfig
Plug 'AndrewRadev/splitjoin.vim'     " Split onelinners with gS

Plug 'Raimondi/delimitMate'          " Auto close quotes parentesis etc
Plug 'godlygeek/tabular'             " Align code
Plug 'vim-scripts/BufOnly.vim'       " Close All other buffers
Plug 'qpkorr/vim-bufkill'            " Keep the window layout when closing buffers
Plug 'mjbrownie/swapit'              " Toggle between true false

" }

" VCS {
Plug 'tpope/vim-fugitive'     " Git wrapper
Plug 'tpope/vim-rhubarb'      " Github extension
Plug 'airblade/vim-gitgutter' " Git gutter simbols
" }

" Languages {
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'jaawerth/nrun.vim'
Plug 'OmniSharp/omnisharp-vim'
Plug 'jamespeapen/swayconfig.vim'
Plug 'karolbelina/uxntal.vim'
Plug 'habamax/vim-godot'
Plug 'lluchs/vim-wren'
" }

" Vim UI {
Plug 'tpope/vim-flagship'               " Statusline
Plug 'Yggdroot/indentLine'              " Ident visual guide
Plug 'gregsexton/MatchTag'              " Highlite Matching tag
" Plug 'gruvbox-community/gruvbox'        " Dark color scheme
Plug 'ellisonleao/gruvbox.nvim'
Plug 'psliwka/vim-smoothie'             " Smooth Scroll
" }

" LSP {

Plug 'w0rp/ale'                      " Async Lint checker
Plug 'neovim/nvim-lspconfig'
Plug 'onsails/lspkind-nvim'

" }

" Completion {

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'

"}

call plug#end()
