" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:
if &compatible
    set nocompatible
endif
set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/bundle'))
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/denite.nvim')
call dein#add('nixprime/cpsm')

call dein#end()

if dein#check_install()
    call dein#install()
endif
call dein#check_lazy_plugins()
call dein#save_state()

filetype plugin indent on
syntax enable

let mapleader="\<Space>"
set wildignore+=vendor/bundle/**,
set wildignore+=node_modules/**,
set wildignore+=bower_components/**,
set wildignore+=.git/**,
set wildignore+=*.meta,
set wildignore+=*.prefab,
set wildignore+=*.sample,
set wildignore+=*.asset,
set wildignore+=*.unity,
set wildignore+=*.anim,
set wildignore+=*.controller,
set wildignore+=*.jpg,
set wildignore+=*.png,
set wildignore+=*.mp3,
set wildignore+=*.wav,
set wildignore+=*.ttf,
set wildignore+=*.pdf,
set wildignore+=*.psd,
set wildignore+=*.shader,
set wildignore+=*.dll,
set wildignore+=*.mat,
set wildignore+=*.file,
set wildignore+=debug/,
set wildignore+=debug/,
set wildignore+=temp/,
set wildignore+=temp/,

" custom var
call denite#custom#var(
            \ 'file_rec', 
            \ 'command',
            \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

" change matchers.
call denite#custom#source(
            \ 'file_rec', 
            \ 'matchers', 
            \ ['matcher_fuzzy','matcher_ignore_globs'])
            " \ ['matcher_cpsm', 'matcher_ignore_globs'])

" change sorters.
call denite#custom#source(
            \ 'file_rec',
            \ 'sorters',
            \ ['sorter_sublime'])

" change ignore_globs
call denite#custom#filter('matcher_ignore_globs',
            \ 'ignore_globs', 
            \ split(&wildignore, ','))

" grep {
    call denite#custom#var('grep', 'command', ['ag'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'final_opts', [])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading'])
" }

" custom mappings {
    nnoremap [denite] <nop>
    nmap <leader>u [denite]
    nnoremap <silent> [denite]b :Denite buffer<cr>
    nnoremap <silent> [denite]p :Denite file_rec<cr>
    nnoremap <silent> [denite]m :Denite menu<cr>
    nnoremap <silent> [denite]g :Denite grep<cr>
    nnoremap <silent> [denite]l :Denite line<cr>
    nnoremap <silent> [denite]y :Denite neoyank<cr>
    nnoremap <silent> [denite]d :Denite dein<cr>
    nnoremap <silent> [denite]h :Denite help<cr>

    call denite#custom#map('insert', '<c-k>', '<denite:move_to_previous_line>', 'noremap')
    call denite#custom#map('insert', '<c-j>', '<denite:move_to_next_line>', 'noremap')
    call denite#custom#map('insert', '<c-r>', '<denite:redraw>', 'noremap')
" }
