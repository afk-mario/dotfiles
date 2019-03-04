" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:

" Notes {
" Personal vimrc of Mario Carballo Zama
" [afk] https://ellugar.co
" This shoould handle all bundle installations
" }

" Config {
set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim
call dein#begin(expand('~/.vim/bundle'))
call dein#add('Shougo/dein.vim')
" }

" Denite {
call dein#add('Shougo/denite.nvim')
call dein#add('Shougo/neomru.vim', {
            \'depends': 'denite.nvim'
            \})
call dein#add('Shougo/unite-outline', {
            \'depends': 'denite.nvim'
            \})
call dein#add('Shougo/neoyank.vim', {
            \'depends': 'denite.nvim'
            \})
call dein#add('tacroe/unite-mark', {
            \'depends': 'denite.nvim'
            \})
call dein#add('tsukkee/unite-tag', {
            \'depends': 'denite.nvim'
            \})
" }

" Utilities{
call dein#add('Shougo/deoplete.nvim')

call dein#add('tpope/vim-vinegar')             " Netrw helper
call dein#add('tpope/vim-obsession')           " Session Managment
call dein#add('tpope/vim-eunuch')              " Unix helpers
call dein#add('tpope/vim-commentary')          " Toggle comments
call dein#add('tpope/vim-surround')            " Sorroundings
call dein#add('tpope/vim-repeat')              " More . command
call dein#add('tpope/vim-abolish')             " Better replace
call dein#add('tpope/vim-unimpaired')          " Key mappings for [

call dein#add('suy/vim-context-commentstring')     " Context commentstring for JSX

call dein#add('wellle/targets.vim')            " Vim plugin that provides additional text objects
call dein#add('editorconfig/editorconfig-vim')
call dein#add('AndrewRadev/splitjoin.vim')     " Split onelinners with gS

call dein#add('SirVer/ultisnips')              " Snippets
call dein#add('honza/vim-snippets')

call dein#add('w0rp/ale')                      " Async Lint checker
call dein#add('Raimondi/delimitMate')          " Auto close quotes parentesis etc
call dein#add('godlygeek/tabular')             " Align code
call dein#add('vim-scripts/BufOnly.vim')       " Close All other buffers
call dein#add('qpkorr/vim-bufkill')
call dein#add('mjbrownie/swapit')              " Toggle between true false
" }

" VCS {
call dein#add('tpope/vim-fugitive')     " Git wrapper
call dein#add('airblade/vim-gitgutter') " Git gutter simbols
" }

" Languages {
call dein#add('ternjs/tern_for_vim', {
            \ 'build': 'npm install',
            \ 'on_ft': ['javascript','javascript.jsx']
            \ })
call dein#add('sheerun/vim-polyglot')
call dein#add('mattn/emmet-vim')
call dein#add('jaawerth/nrun.vim')
call dein#add('zchee/deoplete-jedi')
call dein#add('carlitux/deoplete-ternjs')
call dein#add('OmniSharp/omnisharp-vim')
call dein#add('hail2u/vim-css3-syntax')
" }

" Vim UI {
call dein#add('tpope/vim-flagship')               " Statusline
call dein#add('Yggdroot/indentLine')            " Ident visual guide
call dein#add('gregsexton/MatchTag')              " Highlite Matching tag
call dein#add('morhetz/gruvbox')
" }

call dein#end()

if dein#check_install()
    call dein#install()
endif
call dein#check_lazy_plugins()
call dein#save_state()
