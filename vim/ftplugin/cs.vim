augroup omnisharp_commands
    autocmd!

    " Synchronous build (blocks Vim)
    "autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
    " Builds can also run asynchronously with vim-dispatch installed
    autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>

    " Automatically add new cs files to the nearest project on save
    autocmd BufWritePost *.cs call OmniSharp#AddToProject()

    "show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    "The following commands are contextual, based on the current cursor position.

    nnoremap [omnisharp] <nop>
    nmap <leader>o [omnisharp]
    nnoremap <silent> [omnisharp]d :OmniSharpGotoDefinition<cr>
    nnoremap <silent> [omnisharp]i :OmniSharpFindImplementations<cr>
    nnoremap <silent> [omnisharp]t :OmniSharpFindType<cr>
    nnoremap <silent> [omnisharp]s :OmniSharpFindSymbol<cr>
    nnoremap <silent> [omnisharp]u :OmniSharpFindUsages<cr>
    "finds members in the current buffer
    nnoremap <silent> [omnisharp]fm :OmniSharpFindMembers<cr>
    " cursor can be anywhere on the line containing an issue
    nnoremap <silent> [omnisharp]x  :OmniSharpFixIssue<cr>
    nnoremap <silent> [omnisharp]fx :OmniSharpFixUsings<cr>
    nnoremap <silent> [omnisharp]tt :OmniSharpTypeLookup<cr>
    nnoremap <silent> [omnisharp]dc :OmniSharpDocumentation<cr>
    "navigate up by method/property/field
    autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
    "navigate down by method/property/field
    autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>

augroup END

" this setting controls how long to wait (in ms) before fetching type / symbol information.
set updatetime=500
" Remove 'Press Enter to continue' message when type information is longer than one line.
set cmdheight=2

" Contextual code actions (requires CtrlP or unite.vim)
nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
" Run code actions with text selected in visual mode to extract method
vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr>

" rename with dialog
nnoremap <leader>nm :OmniSharpRename<cr>
nnoremap <F2> :OmniSharpRename<cr>
" rename without dialog - with cursor on the symbol to rename... ':Rename newname'
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

" Force OmniSharp to reload the solution. Useful when switching branches etc.
nnoremap <leader>rl :OmniSharpReloadSolution<cr>
nnoremap <leader>cf :OmniSharpCodeFormat<cr>
" Load the current .cs file to the nearest project
nnoremap <leader>tp :OmniSharpAddToProject<cr>

" (Experimental - uses vim-dispatch or vimproc plugin) - Start the omnisharp server for the current solution
nnoremap <leader>ss :OmniSharpStartServer<cr>
nnoremap <leader>sp :OmniSharpStopServer<cr>

" Add syntax highlighting for types and interfaces
nnoremap <leader>th :OmniSharpHighlightTypes<cr>
"Don't ask to save when changing buffers (i.e. when jumping to a type definition)
set hidden

let g:OmniSharp_selector_ui = 'unite'  

" Define dictionary.
let g:deoplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }


" Define keyword.
if !exists('g:deoplete#keyword_patterns')
    let g:deoplete#keyword_patterns = {}
endif
let g:deoplete#keyword_patterns['default'] = '\h\w*'

autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
" Enable heavy omni completion.
if !exists('g:deoplete#sources#omni#input_patterns')
  let g:deoplete#sources#omni#input_patterns = {}
endif

let g:deoplete#sources#omni#input_patterns.cs = '.*[^=\);]'
