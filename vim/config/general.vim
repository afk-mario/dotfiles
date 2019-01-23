" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:

" Notes {
" Personal vimrc of Mario Carballo Zama
" [afk] https://ellugar.co
" This should handle General configs
" }

filetype plugin indent on   " Automatically detect file types.
syntax on                   " Syntax highlighting
set mouse=a                 " Automatically enable mouse usage
set backup                " Backups are nice ...

set virtualedit=onemore                         " Allow for cursor beyond last character
set history=1000                                " Store a ton of history (default is 20)
set nohidden                                    " Allow buffer switching without saving https://github.com/tpope/vim-vinegar/issues/13

set undofile          " So is persistent undo ...
set undolevels=1000   " Maximum number of changes that can be undone
set undoreload=10000  " Maximum number lines to save for undo on a buffer reload

set backspace=indent,eol,start  " Backspace for dummies

if has('nvim')
    set inccommand=nosplit
endif

if has('clipboard')
    if has('unnamedplus')  " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else         " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif

" Formatting {
set wrap                        " wrap long lines
set autoindent                  " Indent at the same level of the previous line
set expandtab                   " Tabs are spaces, not tabs
set shiftwidth=2                " Use indents of 4 spaces
set tabstop=2                   " An indentation every four columns
set softtabstop=2               " Let backspace delete indent
set smarttab                    " Smart tab actions
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
" }

" Ingore files {
set wildignore+=*.anim,
set wildignore+=*.asset,
set wildignore+=*.controller,
set wildignore+=*.dll,
set wildignore+=*.file,
set wildignore+=*.jpg,
set wildignore+=*.mat,
set wildignore+=*.meta,
set wildignore+=*.mp3,
set wildignore+=*.pdf,
set wildignore+=*.png,
set wildignore+=*.prefab,
set wildignore+=*.psd,
set wildignore+=*.sample,
set wildignore+=*.shader,
set wildignore+=*.ttf,
set wildignore+=*.unity,
set wildignore+=*.unitypackage,
set wildignore+=*.wav,
set wildignore+=.git/**,
set wildignore+=Debug/,
set wildignore+=Temp/,
set wildignore+=bower_components/**,
set wildignore+=debug/,
set wildignore+=node_modules/**,
set wildignore+=temp/,
set wildignore+=vendor/bundle/**,
" }
