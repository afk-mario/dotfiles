" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:

" Notes {
" Personal vimrc of Mario Carballo Zama
" [afk] https://ellugar.co
" This should handle all UI configs
" }

set termguicolors
colorscheme gruvbox

highlight clear SignColumn      " SignColumn should match background
highlight clear LineNr          " Current line number row will have same background color in relative mode

set tabpagemax=15               " Only show 15 tabs
set cursorline                  " Highlight current line
set linespace=0                 " No extra spaces between rows
set number                      " line numbers on
set relativenumber
set showmatch                   " Show matching brackets/parenthesis
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmode=longest:full,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set list

highlight VertSplit cterm=none ctermbg=none ctermfg=247

if has('statusline')
    set showtabline=2
    set guioptions-=e
    set statusline=%t       "tail of the filename
    set laststatus=3        "global statusline

    set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
    set statusline+=%{&ff}] "file format
    set statusline+=%h      "help file flag
    set statusline+=%m      "modified flag
    set statusline+=%r      "read only flag
    set statusline+=%y      "filetype
    set statusline+=%=      "left/right separator
    set statusline+=%c,     "cursor column
    set statusline+=%l/%L   "cursor line/total lines
    set statusline+=\ %P    "percent through file


    set statusline+=%#warningmsg#
    set statusline+=%*
endif
