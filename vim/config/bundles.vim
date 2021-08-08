" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:

" Notes {
" Personal vimrc of Mario Carballo Zama
" [afk] https://ellugar.co
" This shoould handle all bundle installations
" }

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

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'tpope/vim-sensible'            " Sensible defaults
Plug 'tpope/vim-vinegar'             " Netrw helper
Plug 'tpope/vim-eunuch'              " Unix helpers
Plug 'tpope/vim-commentary'          " Toggle comments
Plug 'tpope/vim-surround'            " Sorroundings
Plug 'tpope/vim-repeat'              " More . command
Plug 'tpope/vim-abolish'             " Better replace
Plug 'tpope/vim-unimpaired'          " Key mappings for [
Plug 'tpope/vim-dispatch'            " Run async commands in GIT

Plug 'suy/vim-context-commentstring' " Context commentstring for JSX

Plug 'wellle/targets.vim'            " Vim plugin that provides additional text objects
Plug 'editorconfig/editorconfig-vim' " Editor configurations .editorconfig
Plug 'AndrewRadev/splitjoin.vim'     " Split onelinners with gS

Plug 'SirVer/ultisnips'              " Snippets
Plug 'honza/vim-snippets'

Plug 'w0rp/ale'                      " Async Lint checker
Plug 'Raimondi/delimitMate'          " Auto close quotes parentesis etc
Plug 'godlygeek/tabular'             " Align code
Plug 'vim-scripts/BufOnly.vim'       " Close All other buffers
Plug 'qpkorr/vim-bufkill'            " Keep the window layout when closing buffers
Plug 'mjbrownie/swapit'              " Toggle between true false
Plug 'ludovicchabant/vim-gutentags'  " Tag files
Plug 'takac/vim-hardtime'            " Break that annoying habit

" }

" VCS {
Plug 'tpope/vim-fugitive'     " Git wrapper
Plug 'tpope/vim-rhubarb'      " Github extension
Plug 'airblade/vim-gitgutter' " Git gutter simbols
" }

" Languages {
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'jaawerth/nrun.vim'
" Plug 'zchee/deoplete-jedi'
Plug 'OmniSharp/omnisharp-vim'
" }

" Vim UI {
Plug 'tpope/vim-flagship'               " Statusline
Plug 'Yggdroot/indentLine'              " Ident visual guide
Plug 'gregsexton/MatchTag'              " Highlite Matching tag
Plug 'gruvbox-community/gruvbox'        " Dark color scheme
Plug 'psliwka/vim-smoothie'             " Smooth Scroll
" }

call plug#end()
