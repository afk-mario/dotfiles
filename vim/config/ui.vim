" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:

" Notes {
" Personal vimrc of Mario Carballo Zama
" [afk] https://ellugar.co
" This should handle all UI configs
" }

set termguicolors
colorscheme gruvbox
" colorscheme nightfly

" https://joshtronic.com/2018/06/04/set-vim-background-based-on-your-terminals-background-color/
" if exists('theme') && theme ==# 'light'
"     set background=light
"     colorscheme one
" else
"     set background=dark
"     colorscheme gruvbox
" endif

highlight clear SignColumn      " SignColumn should match background
highlight clear LineNr          " Current line number row will have same background color in relative mode

set tabpagemax=15               " Only show 15 tabs
set cursorline                  " Highlight current line
set linespace=0                 " No extra spaces between rows
set number                      " line numbers on
set relativenumber
set showmatch                   " Show matching brackets/parenthesis
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmode=longest:full,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set foldenable                  " Auto fold code
set list
set fillchars=vert:│,fold:-
highlight VertSplit cterm=none ctermbg=none ctermfg=247

" Override vim-sensible chars for identation
set listchars=tab:│\ ,trail:-,extends:│,precedes:<,nbsp:+

if has('statusline')
    set showtabline=2
    set guioptions-=e
    set statusline=%t       "tail of the filename
    set laststatus=3        "global statusline

    " if !dein#tap('vim-flagship')
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
    " endif
endif
