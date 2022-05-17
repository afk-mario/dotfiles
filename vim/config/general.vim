" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:

" Notes {
" Personal vimrc of Mario Carballo Zama
" [afk] https://ellugar.co
" This should handle General configs
" }

" Automatically enable mouse usage
set mouse=a
" Backups are nice ...
set backup

" Dont know why for default is on the current folder
set backupdir=~/.local/share/nvim/backup//

" Allow for cursor beyond last character
set virtualedit=onemore

" Allow buffer switching without saving https://github.com/tpope/vim-vinegar/issues/13
set nohidden

set undofile          " So is persistent undo ...
set undolevels=1000   " Maximum number of changes that can be undone
set undoreload=10000  " Maximum number lines to save for undo on a buffer reload

set inccommand=nosplit
" https://github.com/nvim-treesitter/nvim-treesitter#available-modules=
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable

" Formatting {
set wrap                        " wrap long lines
set linebreak                   " dont break words
set expandtab                   " Tabs are spaces, not tabs
set shiftwidth=2                " Use indents of 4 spaces
set tabstop=2                   " An indentation every four columns
set softtabstop=2               " Let backspace delete indent
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
" }

" NETWR {
let g:netrw_browse_split = 4
" }
