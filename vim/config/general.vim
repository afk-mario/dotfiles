" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:

" Notes {
    " Personal vimrc of Mario Carballo Zama
    " [afk] https://ellugar.co
    " This should handle General configs
" }

set background=dark
filetype plugin indent on   " Automatically detect file types.
syntax on                   " Syntax highlighting
set mouse=a                 " Automatically enable mouse usage
set mousehide               " Hide the mouse cursor while typing
set complete-=i             " Complete only on current buffer http://stackoverflow.com/questions/2169645/vims-autocomplete-is-excruciatingly-slow
set nrformats-=octal        " Ctrl A considers numbers starting with 0 octal
scriptencoding utf-8

augroup cwdbuffer
    " autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif " Always switch to the current file directory
augroup end

if has('clipboard')
    if has('unnamedplus')  " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else         " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif

set shortmess+=filmnrxoOtT                      " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore                         " Allow for cursor beyond last character
set history=1000                                " Store a ton of history (default is 20)
set nohidden                                    " Allow buffer switching without saving https://github.com/tpope/vim-vinegar/issues/13
set iskeyword-=.                                " '.' is an end of word designator
set iskeyword-=#                                " '#' is an end of word designator
set iskeyword-=-                                " '-' is an end of word designator

function! ResCur()
    if line("'\"") <= line('$')
        silent! normal! g`"
        return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

set backup                " Backups are nice ...
if has('persistent_undo')
    set undofile          " So is persistent undo ...
    set undolevels=1000   " Maximum number of changes that can be undone
    set undoreload=10000  " Maximum number lines to save for undo on a buffer reload
endif

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

" Formatting {
    set wrap                        " wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
    set smarttab                    " Smart tab actions
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current
    "set matchpairs+=<:>             " Match, to be used with %
    set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
" }
