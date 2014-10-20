if has('vim_starting')
    set nocompatible               " Be iMproved

    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'bling/vim-bufferline'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'duythinht/vim-coffee'
NeoBundle 'altercation/vim-colors-solarized.git'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'elzr/vim-json',
NeoBundle 'nathanaelkane/vim-indent-guides',
NeoBundle 'scrooloose/syntastic',
NeoBundle 'mattn/emmet-vim',
NeoBundle 'gregsexton/MatchTag',
NeoBundle 'Raimondi/delimitMate',
NeoBundle 'othree/html5.vim',
NeoBundle 'bling/vim-airline'
NeoBundle 'ervandew/supertab',
NeoBundle 'sjl/gundo.vim',
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'vim-scripts/django.vim'
NeoBundle 'wavded/vim-stylus'
NeoBundle 'vim-scripts/darkspectrum'
NeoBundle 'sjl/badwolf'
NeoBundle 'dasch/vim-mocha',
NeoBundle 'Shougo/vimproc', {
            \ 'build' : {
            \     'windows' : 'make -f make_mingw32.mak',
            \     'cygwin' : 'make -f make_cygwin.mak',
            \     'mac' : 'make -f make_mac.mak',
            \     'unix' : 'make -f make_unix.mak',
            \    },
            \ }
" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" Mine
let mapleader=","
set showcmd
set number
syntax enable
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set hidden
set background=dark
colorscheme coffee
map <F11> :let &background = ( &background == "dark"? "light" : "dark" )<CR>

"Buffer
nmap <leader>T :enew<cr>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>
let g:netrw_preview = 1

"Tcab
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

let g:syntastic_check_on_open=1
let g:badwolf_darkgutter = 1
let g:badwolf_css_props_highlight = 1


let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set shiftwidth=4
iabbrev </ </<C-X><C-O>


" Xclip
map <F7> :w !xclip<CR><CR>
vmap <F7> "*y
map <S-F7> :r!xclip -o<CR>"

"vim-airline
""Fixes
let g:airline#extensions#tabline#enabled = 1
set encoding=utf-8 " Necessary to show Unicode glyphs
let g:Powerline_symbols = 'fancy'"
let g:airline_powerline_fonts = 1
set laststatus=2
set noshowmode
set t_Co=256

let g:airline_detect_paste=1
let g:airline_theme='badwolf'