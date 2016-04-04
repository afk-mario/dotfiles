autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd Filetype markdown call SetMarkdownOptions()
set spell spelllang=en_us
highlight CursorLine ctermbg=NONE
