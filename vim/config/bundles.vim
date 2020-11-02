" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:

" Notes {
" Personal vimrc of Mario Carballo Zama
" [afk] https://ellugar.co
" This shoould handle all bundle installations
" }

" Config {
call plug#begin('~/.vim/plugged')
" }

" Utilities{
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'Shougo/deoplete.nvim'

Plug 'tpope/vim-vinegar'             " Netrw helper
Plug 'tpope/vim-obsession'           " Session Managment
Plug 'tpope/vim-eunuch'              " Unix helpers
Plug 'tpope/vim-commentary'          " Toggle comments
Plug 'tpope/vim-surround'            " Sorroundings
Plug 'tpope/vim-repeat'              " More . command
Plug 'tpope/vim-abolish'             " Better replace
Plug 'tpope/vim-unimpaired'          " Key mappings for [

Plug 'suy/vim-context-commentstring'     " Context commentstring for JSX

Plug 'wellle/targets.vim'            " Vim plugin that provides additional text objects
Plug 'editorconfig/editorconfig-vim'
Plug 'AndrewRadev/splitjoin.vim'     " Split onelinners with gS

Plug 'SirVer/ultisnips'              " Snippets
Plug 'honza/vim-snippets'

Plug 'w0rp/ale'                      " Async Lint checker
Plug 'Raimondi/delimitMate'          " Auto close quotes parentesis etc
Plug 'godlygeek/tabular'             " Align code
Plug 'vim-scripts/BufOnly.vim'       " Close All other buffers
Plug 'qpkorr/vim-bufkill'
Plug 'mjbrownie/swapit'              " Toggle between true false
" }

" VCS {
Plug 'tpope/vim-fugitive'     " Git wrapper
Plug 'tpope/vim-rhubarb'     " Git wrapper
Plug 'airblade/vim-gitgutter' " Git gutter simbols
" }

" Languages {
Plug 'sheerun/vim-polyglot'
Plug 'jparise/vim-graphql'
Plug 'mattn/emmet-vim'
Plug 'jaawerth/nrun.vim'
Plug 'zchee/deoplete-jedi'
Plug 'OmniSharp/omnisharp-vim'
Plug 'fatih/vim-go'
" }

" Vim UI {
Plug 'tpope/vim-flagship'               " Statusline
Plug 'Yggdroot/indentLine'            " Ident visual guide
Plug 'gregsexton/MatchTag'              " Highlite Matching tag
Plug 'gruvbox-community/gruvbox'
Plug 'ayu-theme/ayu-vim'
" }

call plug#end()
