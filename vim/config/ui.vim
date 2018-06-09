" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:

" Notes {
    " Personal vimrc of Mario Carballo Zama
    " [afk] https://ellugar.co
    " This should handle all UI configs
" }

if has('gui_running')
    set guioptions-=T                          " Remove the toolbar
    set lines=40                               " 40 lines of text instead of 24
else
    if &term ==? 'xterm' || &term ==? 'screen'
        set t_Co=256                           " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
    endif
endif

if has('termguicolors')
    set termguicolors
endif

if dein#tap('gruvbox')
    " change depenging on hour http://benjamintan.io/blog/2014/04/10/switch-solarized-light-slash-dark-depending-on-the-time-of-day/
    colorscheme gruvbox
elseif dein#tap('ayu-vim')
    set termguicolors     " enable true colors support
    " let ayucolor="light"  " for light version of theme
    " let ayucolor="mirage" " for mirage version of theme
    let ayucolor="dark"   " for dark version of theme
    colorscheme ayu
elseif dein#tap('vim-hybrid')
    let g:hybrid_custom_term_colors = 1
    colorscheme hybrid
elseif den#tap('vim-colors-solarized')
    let g:solarized_termcolors=256
    let g:solarized_termtrans=1
    let g:solarized_contrast='normal'
    let g:solarized_visibility='normal'
    colorscheme solarized             " Load a colorscheme
endif

highlight clear SignColumn      " SignColumn should match background
highlight clear LineNr          " Current line number row will have same background color in relative mode

if has('cmdline_info')
    set ruler                   " Show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
    set showcmd                 " Show partial commands in status line and
endif

if has('statusline')
    set laststatus=2
    set showtabline=2
    set guioptions-=e
    set statusline=%t       "tail of the filename

    if !dein#tap('vim-flagship')
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
endif

if has('nvim')
    set inccommand=nosplit
endif

set tabpagemax=15               " Only show 15 tabs
set cursorline                  " Highlight current line
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set number                      " line numbers on
set relativenumber
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=longest:full,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set display+=lastline
set foldenable                  " Auto fold code
set list
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set fillchars=vert:│,fold:-
highlight VertSplit cterm=none ctermbg=none ctermfg=247

" Netrw {
    " https://github.com/tpope/vim-vinegar/issues/13
    augroup netrw_buf_hidden_fix
        autocmd FileType netrw setl bufhidden=delete
        autocmd!
        " Set all non-netrw buffers to bufhidden=hide
        autocmd BufWinEnter *
                    \  if &ft != 'netrw'
                    \|     set bufhidden=hide
                    \| endif
    augroup end
    let g:netrw_browse_split = 4
" }
