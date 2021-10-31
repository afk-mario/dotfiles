" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:

" Notes {
" Personal vimrc of Mario Carballo Zama
" [afk] https://ellugar.co
" This should handle General configs
" }


" https://github.com/neovim/neovim/issues/6802
" let $COLORTERM = "gnome-terminal"
filetype plugin indent on   " Automatically detect file types.
syntax on                   " Syntax highlighting
set mouse=a                 " Automatically enable mouse usage
set backup                " Backups are nice ...

set virtualedit=onemore                         " Allow for cursor beyond last character
set nohidden                                    " Allow buffer switching without saving https://github.com/tpope/vim-vinegar/issues/13

set undofile          " So is persistent undo ...
set undolevels=1000   " Maximum number of changes that can be undone
set undoreload=10000  " Maximum number lines to save for undo on a buffer reload

" Character after pasting from browser ^M
" https://github.com/vim/vim/issues/1404

if has('nvim')
    set inccommand=nosplit
endif

" Formatting {
set wrap                        " wrap long lines
set linebreak                   " dont break words
set expandtab                   " Tabs are spaces, not tabs
set shiftwidth=2                " Use indents of 4 spaces
set tabstop=2                   " An indentation every four columns
set softtabstop=2               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
" }

" NETWR {
let g:netrw_browse_split = 4
" }

" Complete {
" Recomended settings over
" https://github.com/lifepillar/vim-mucomplete
" set completeopt+=noselect
" If Vim beeps during completion
set belloff+=ctrlg
" set omnifunc=syntaxcomplete#Complete
" }
