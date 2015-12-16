nnoremap <silent> [unite]l
	  \ :<C-u>Unite 
	  \ -buffer-name=Search
	  \ -no-split
	  \ -start-insert
	  \ line<CR>

nnoremap <silent> [unite]#
	  \ :<C-u>Unite 
	  \ -buffer-name=OmniSharp
	  \ -no-split
	  \ -start-insert
	  \ OmniSharp/findtype<CR>

nnoremap <silent> [unite]y
	  \ :<C-u>Unite 
	  \ -buffer-name=Yank
	  \ -no-split
	  \ -start-insert
	  \ history/yank<CR>

set wildignore+=vendor/bundle/**
set wildignore+=node_modules/**
set wildignore+=bower_components/**
set wildignore+=.git/**
set wildignore+=*.meta
set wildignore+=*.prefab
set wildignore+=*.sample
set wildignore+=*.asset
set wildignore+=*.unity
set wildignore+=*.anim
set wildignore+=*.controller
set wildignore+=*.jpg
set wildignore+=*.png
set wildignore+=*.mp3
set wildignore+=*.wav
set wildignore+=*.ttf

call unite#custom#source('file_rec/async,file_rec/git', 'ignore_globs', split(&wildignore, ','))

