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
    call dein#add('Shougo/vimproc.vim', {'build': 'make'})
    call dein#add('Shougo/deoplete.nvim')

    call dein#add('tpope/vim-dispatch')            " Asynchronous build and test dispatcher
    call dein#add('tpope/vim-vinegar')             " Netrw helper
    call dein#add('tpope/vim-obsession')           " Session Managment
    call dein#add('tpope/vim-eunuch')              " Unix helpers
    call dein#add('tpope/vim-commentary')          " Toggle comments
    call dein#add('tpope/vim-scriptease')       
    call dein#add('tpope/vim-surround')            " Sorroundings
    call dein#add('tpope/vim-repeat')              " More . command
    call dein#add('tpope/vim-abolish')             " Better replace
    call dein#add('tpope/vim-unimpaired')          " Key mappings for [

    call dein#add('suy/vim-context-commentstring') " suuport for jsx comments

    call dein#add('editorconfig/editorconfig-vim')
    call dein#add('tommcdo/vim-exchange')          " Exchange motion
    call dein#add('AndrewRadev/splitjoin.vim')     " Split onelinners with gS

    call dein#add('SirVer/ultisnips')              " Snippets
    call dein#add('honza/vim-snippets')
    call dein#add('epilande/vim-react-snippets')   " react-snippets

    call dein#add('w0rp/ale')                      " Async Lint checker
    call dein#add('wellle/targets.vim')            " Better motions
    call dein#add('Raimondi/delimitMate')          " Auto close quotes parentesis etc
    call dein#add('mhinz/vim-grepper')             " Multiple grep support
    call dein#add('sjl/gundo.vim')                 " Undo tree
    call dein#add('godlygeek/tabular')             " Align code
    call dein#add('vim-scripts/BufOnly.vim')       " Close All other buffers
    call dein#add('qpkorr/vim-bufkill')
    call dein#add('mjbrownie/swapit')              " Toggle between true false
    call dein#add('ternjs/tern_for_vim', {
                \ 'build': 'npm install',
                \ 'on_ft': ['javascript','javascript.jsx']
                \ })
" }

" Prose {
    call dein#add('reedes/vim-pencil', {'on_ft': ['markdown', 'text']})
    call dein#add('reedes/vim-lexical', {'on_ft': ['markdown', 'text']})
    call dein#add('reedes/vim-wordy', {'on_ft': ['markdown', 'text']})
    call dein#add('dbmrq/vim-ditto', {'on_ft': ['markdown', 'text']})
    call dein#add('junegunn/goyo.vim', {'on_ft': ['markdown', 'text']})
    call dein#add('junegunn/limelight.vim', {'on_ft': ['markdown', 'text']})
    " call dein#add('reedes/vim-textobj-sentence', {'in_ft': 'markdown'})
" }

" VCS {
    call dein#add('tpope/vim-fugitive')     " Git wrapper
    call dein#add('airblade/vim-gitgutter') " Git gutter simbols
    " call dein#add('mhinz/vim-signify')
" }

" Languages {
    call dein#add('sheerun/vim-polyglot',{
                \})
    call dein#add('racer-rust/vim-racer', {
                \ })
    call dein#add('mattn/emmet-vim', {
                \ })
    call dein#add('hail2u/vim-css3-syntax', {
                \ 'on_ft': 'css'
                \ })
    call dein#add('jaawerth/nrun.vim', {
                \ })
    call dein#add('zchee/deoplete-jedi', {
                \ 'on_ft': 'python'
                \ })
    call dein#add('vim-scripts/django.vim', {
                \ 'on_ft': 'python'
                \ })
    call dein#add('carlitux/deoplete-ternjs', {
                \ 'on_ft': ['javascript','javascript.jsx']
                \ })
    if OSX()
        call dein#add('OmniSharp/omnisharp-vim', {
                    \ 'build': 'sh -c "cd server/ && xbuild"',
                    \ 'on_ft': 'cs'
                    \ })
        " call dein#add('Robzz/deoplete-omnisharp',{
        "             \ 'on_ft': 'cs',
        "             \ 'depends': 'omnisharp-vim'
        "             \ })
    endif
" }

" Vim UI {
    call dein#add('tpope/vim-flagship')               " Statusline
    call dein#add('Yggdroot/indentLine')  " Ident visual guide
    call dein#add('gregsexton/MatchTag')              " Highlite Matching tag
    call dein#add('altercation/vim-colors-solarized')
    call dein#add('w0ng/vim-hybrid')
    call dein#add('morhetz/gruvbox')
    call dein#add('ayu-theme/ayu-vim')
" }

call dein#end()

if dein#check_install()
  call dein#install()
endif
call dein#check_lazy_plugins()
call dein#save_state()
