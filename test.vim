" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:
if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/bundle'))
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/denite.nvim')

call dein#end()

if dein#check_install()
    call dein#install()
endif
call dein#check_lazy_plugins()
call dein#save_state()

filetype plugin indent on
syntax enable

call denite#custom#var('file_rec', 'command', ['denite_file_list.sh'])
call denite#custom#source('file_rec', 'matchers', ['matcher_fuzzy', 'matcher_project_files'])

nnoremap <silent> ff :Denite file_rec<CR>
" call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')
" call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
