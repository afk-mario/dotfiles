" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:

" Notes {
    " Personal vimrc of Mario Carballo Zama
    " [afk] https://ellugar.co
    " This should handle All Mappings config
" }

let g:mapleader="\<Space>"

" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk

" Disable arrows
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

nnoremap <silent> <leader>k :Lexplore<cr>

" Buffers {
    nnoremap [buffer] <nop>
    nmap <leader>b [buffer]
    nnoremap <silent> [buffer]t :enew<cr>
    nnoremap <silent> [buffer]l :bnext<cr>
    nnoremap <silent> [buffer]h :bprevious<cr>
    nnoremap <silent> [buffer]q :bp <BAR> bd #<cr>
    nnoremap <silent> [buffer]w :bw<cr>
    nnoremap <silent> [buffer]s :ls<cr>
    nnoremap <silent> [buffer]1 :bfirst<cr>
    nnoremap <silent> [buffer]0 :blast<cr>
    " https://stackoverflow.com/questions/4298910/vim-close-buffer-but-not-split-window
    " nnoremap <silent> [buffer], :b#<bar>bd#<cr>
" }

" Tabs {
    nnoremap [tab] <nop>
    nmap <leader>t [tab]
    nnoremap <silent> [tab]t :tabnew<cr>
    nnoremap <silent> [tab]l :tabnext<cr>
    nnoremap <silent> [tab]h :tabprevious<cr>
    nnoremap <silent> [tab]q :tabclose<cr>
    nnoremap <silent> [tab]1 :tabfirst<cr>
    nnoremap <silent> [tab]0 :tablast<cr>
" }

" Language {
    nnoremap [spell] <nop>
    nmap <leader>s [spell]
    nnoremap <silent> [spell]s :setlocal spell spelllang=es_es<cr>
    nnoremap <silent> [spell]n :setlocal spell spelllang=en_en<cr>
" }

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>

" Easier formatting
nnoremap <silent> <leader>q wip

inoremap <C-U> <C-G>u<C-U>

" Code folding options
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>

nmap <leader>l :set list!<CR>

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif
