" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:

" Notes {
    " Personal vimrc of Mario Carballo Zama
    " [afk] https://ellugar.co
    " This should handle all plugins config
" }

" Languages {
    if dein#tap('vim-polyglot')
    " JSX {
        let g:jsx_ext_required = 0 " Allow JSX in normal JS files
    " }

    " Rust {
        let g:formatdef_rustfmt='"rustfmt"'
        let g:formatters_rust=['rustfmt']
        let g:rustfmt_autosave = 1
        let g:racer_cmd=expand('~/.cargo/bin/racer')
    " }
    endif
" }

" Gundo {
    if dein#tap('gundo.vim')
        let g:gundo_prefer_python3 = 1
        nnoremap <leader>g :GundoToggle<CR>
    endif
" }

" Tabular {
    if dein#tap('tabular')
        " nnoremap [tabular] <nop>
        " nmap <Leader>t [tabular]
        " nmap <Leader> [tabular]& :Tabularize /&<CR>
        " vmap <Leader> [tabular]= :Tabularize /^[^=]*\zs=<CR>
        " nmap <Leader> [tabular]1= :Tabularize 1=<CR>
        " nmap <Leader> [tabular]=> :Tabularize /=><CR>
        " nmap <Leader> [tabular]: :Tabularize /:<CR>
        " nmap <Leader> [tabular]:: :Tabularize /:\zs<CR>
        " nmap <Leader> [tabular], :Tabularize /,<CR>
        " nmap <Leader> [tabular],, :Tabularize /,\zs<CR>
        " nmap <Leader> [tabular]<Bar> :Tabularize /<Bar><CR>
    endif
"}

" NeoMake {
    if dein#tap('neomake')
        autocmd! BufWritePost,BufEnter * Neomake
        let g:neomake_echo_current_error=1
        let g:neomake_verbose=1

        " JS {
            " you can set your enabled makers globally (like below) or on the buffer level as part of an autocmd - see Neomake docs for details
            let g:neomake_javascript_enabled_makers = ['eslint']
            " when switching/opening a JS buffer, set neomake's eslint path, and enable it as a maker
            au BufEnter *.js let b:neomake_javascript_eslint_exe = nrun#Which('eslint')
            " autocmd! FileType javascript,BufWinEnter,BufWritePost * Neomake
        " }

        nnoremap [neomake] <nop>
        nmap <leader>c [neomake]
        nnoremap <silent> [neomake]o :lopen<cr>
        nnoremap <silent> [neomake]c :lclose<cr>
        nnoremap <silent> [neomake], :ll<cr>
        nnoremap <silent> [neomake]l :lnext<cr>
        nnoremap <silent> [neomake]h :lprev<cr>
    endif
" }

" Ale {
    let g:ale_sign_column_always = 1
    let g:ale_fix_on_save = 1

    let g:ale_linters = {
    \   'javascript': ['eslint'],
    \   'python': ['flake8'],
    \   'rust': ['cargo'],
    \ }

    let g:ale_fixers = {}
    let g:ale_fixers['javascript'] = ['prettier']
    let g:ale_fixers['json'] = ['prettier']
    let g:ale_fixers['css'] = ['prettier']
    let g:ale_fixers['python'] = ['isort', 'yapf']
    let g:ale_fixers['rust'] = ['rustfmt']
    let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'


    nnoremap [ale] <nop>
    nmap <leader>a [ale]
    nnoremap <silent> [ale]f :ALEFix<cr>
" }

" Emmet {
    if dein#tap('emmet-vim')
        " let g:user_emmet_install_global = 0
        " autocmd FileType html,css,jsx,js EmmetInstall
        iabbrev </ </<C-X><C-O>
        let g:user_emmet_settings = {
            \  'javascript' : {
            \      'extends' : 'jsx',
            \  },
        \}
    endif
" }

" Flagship {
    if dein#tap('vim-flagship')
        autocmd User Flags call Hoist("window", "SyntasticStatuslineFlag")
        " autocmd User Flags call Hoist("global", "%{&ignorecase ? '[IC]' : ''}")
        let g:tabprefix = '[afk]'
    endif
" }

" Deoplete {
    if dein#tap('deoplete.nvim')
        let g:deoplete#enable_at_startup = 1
        " let g:deoplete#file#enable_buffer_path=1

        call deoplete#custom#option({
            \ 'auto_complete_delay': 0,
            \ 'smart_case': v:true,
        \ })

        call deoplete#custom#option('sources', {
            \ '_': ['buffer', 'ultisnips', 'file', 'buffer'],
            \ 'cs': ['cs', 'ultisnips', 'file', 'buffer'],
            \ 'python': ['jedi', 'ultisnips', 'file', 'buffer'],
            \ 'javascript.jsx': ['tern', 'ultisnips', 'buffer'],
            \})

        call deoplete#custom#source('omni', 'input_patterns', {
                    \ 'cs': '\w*',
                    \ 'rust': '[(\.)(::)]',
                    \})

        call deoplete#custom#source('buffer', 'mark', '[b]')
        call deoplete#custom#source('tern', 'mark', '[js]')
        call deoplete#custom#source('omni', 'mark', '[⌾]')
        call deoplete#custom#source('file', 'mark', '[f]')
        call deoplete#custom#source('jedi', 'mark', '[j]')
        call deoplete#custom#source('ultisnips', 'mark', '[u]')

        call deoplete#custom#source('_', 'min_pattern_length', 2)

        " Use Tab
        imap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ deoplete#mappings#manual_complete()

        function! s:check_back_space() abort
            let l:col = col('.') - 1
            return l:col || getline('.')[l:col - 1]  =~# '\s'
        endfunction

        " Close window on finish
        autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

        au BufNewFile,BufRead *.{stylus,styl} set ft=stylus.css

        aug omnicomplete
            au!
            au FileType css,sass,scss,stylus,less setl omnifunc=csscomplete#CompleteCSS
            au FileType html,htmldjango,jinja,markdown setl omnifunc=emmet#completeTag
            au FileType python setl omnifunc=pythoncomplete#Complete
            au FileType xml setl omnifunc=xmlcomplete#CompleteTags
            au FileType javascript,javascript.jsx setl omnifunc=javascriptcomplete#CompleteJS
        aug END

    endif
" }

" UltiSnips {
    if dein#tap('ultisnips')
        set runtimepath+=~/.vim/snips
        " Trigger configuration.
        let g:UltiSnipsExpandTrigger='<c-e>'
        let g:UltiSnipsJumpForwardTrigger='<c-r>'
        let g:UltiSnipsJumpBackwardTrigger='<c-w>'

        " If you want :UltiSnipsEdit to split your window.
        let g:UltiSnipsEditSplit='vertical'
        let g:UltiSnipsSnippetsDir='~/.vim/snips/UltiSnips'
        let g:UltiSnipsSnippetDirectories = ['UltiSnips']

        " Use Python Version
        let g:UltiSnipsUsePythonVersion = 3
        let g:ultisnips_python_style='google'
    endif
" }

" Fugitive {
    if dein#tap('vim-fugitive')
        nnoremap [fugitive] <nop>
        nmap <leader>g [fugitive]
        nnoremap <silent> [fugitive]s :Gstatus<CR>
        nnoremap <silent> [fugitive]d :Gdiff<CR>
        nnoremap <silent> [fugitive]c :Gcommit<CR>
        nnoremap <silent> [fugitive]b :Gblame<CR>
        nnoremap <silent> [fugitive]l :Glog<CR>
        nnoremap <silent> [fugitive]p :Git push<CR>
        nnoremap <silent> [fugitive]r :Gread<CR>
        nnoremap <silent> [fugitive]w :Gwrite<CR>
        nnoremap <silent> [fugitive]e :Gedit<CR>
        " Mnemonic _i_nteractive
        nnoremap <silent> [fugitive]i :Git add -p %<CR>
        nnoremap <silent> [fugitive]g :SignifyToggle<CR>
        if !dein#tap('vim-flagship')
            set statusline+=%{fugitive#statusline()} " Git integration
        endif
    endif
"}

" Obsession {
    if dein#tap('vim-obsession')
        set statusline+=%{ObsessionStatus()}     " ObsessionStatus
    endif
"}

" indent_guides {
    if dein#tap('indentLine')
        let g:indentLine_char = '│'
        let g:indentLine_first_char = '│'
        let g:indentLine_showFirstIndentLevel = 1
        " let g:indentLine_setColors = 0
    endif
" }

" Startify {
    if dein#tap('vim-startify')
        let g:startify_list_order = [
            \ [' Sessions '],
            \ 'sessions',
            \ [' Bookmarks '],
            \ 'bookmarks',
            \ [' MRU (dir)'],
            \ 'dir',
            \ [' MRU '],
            \ 'files',
        \ ]
        let g:startify_bookmarks = [ {'v': '~/.vim/'}, {'z': '~/.zshrc'} ]
        let g:startify_files_number = 5
        let g:startify_session_autoload = 1
        let g:startify_change_to_vcs_root = 1
    endif
" }

" Lexical {
    if dein#tap('vim-lexical')
        " let g:lexical#spelllang = ['en_us', 'es_mx',]
    endif
" }

" Ditto {
    if dein#tap('vim-ditto')
        augroup ditto
            au FileType markdown,text,tex DittoOn  " Turn on Ditto's autocmds
        augroup end
    endif
" }

" Pencil {
    if dein#tap('vim-pencil')
        let g:pencil#wrapModeDefault = 'soft'
        " autocmd Filetype markdown call pencil#init()
        augroup pencil
            autocmd!
            autocmd FileType markdown,mkd,md call pencil#init()
            autocmd FileType text         call pencil#init()
        augroup END
    endif
" }

" Goyo and Limelight and Pencil{
    if dein#tap('goyo.vim')
        " let g:goyo_margin_top=0
        " let g:goyo_margin_bottom=0
        augroup goyo
            autocmd! User GoyoEnter Limelight
            autocmd! User GoyoLeave Limelight!
        augroup end
        nnoremap <leader>G :Goyo<CR>

        autocmd Filetype markdown call LaunchGoyo()
        autocmd Filetype text call LaunchGoyo()
        function LaunchGoyo()
          Goyo
        endfunction
    endif
" }

" OmniSharp {
    if dein#tap('omnisharp-vim')
        let g:OmniSharp_server_type = 'v1'
        " let g:OmniSharp_server_type = 'roslyn'
        let g:OmniSharp_timeout = 100

        au FileType cs OmniSharpHighlightTypes
        " Automatically add new cs files to the nearest project on save
        autocmd BufWritePost *.cs call OmniSharp#AddToProject()
        "show type information automatically when the cursor stops moving
        " autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

        nnoremap [omnisharp] <nop>
        nmap <leader>o [omnisharp]
        nnoremap <silent> [omnisharp]i :OmniSharpFindImplementations<cr>
        nnoremap <silent> [omnisharp]u :OmniSharpFindUsages<cr>
        nnoremap <silent> [omnisharp]f :OmniSharpFindMembers<cr>
        nnoremap <silent> [omnisharp]x :OmniSharpFixIssue<cr>
        nnoremap <silent> [omnisharp]X :OmniSharpFixUsings<cr>
        nnoremap <silent> [omnisharp]l :OmniSharpTypeLookup<cr>
        nnoremap <silent> [omnisharp]r :OmniSharpRename<cr>
        nnoremap <silent> [omnisharp]R :OmniSharpReloadSolution<cr>
        nnoremap <silent> [omnisharp]F :OmniSharpCodeFormat<cr>
        nnoremap <silent> [omnisharp]h :OmniSharpHighlightTypes<cr>

        " Override Vim Gotodefinition
        autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
        "navigate up by method/property/field
        autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
        "navigate down by method/property/field
        autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>
        " rename without dialog - with cursor on the symbol to rename... ':Rename newname'
        command! -nargs=1 ORename :call OmniSharp#RenameTo("<args>")

        autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

        " Not supported with denite yet
        " let g:OmniSharp_selector_ui = 'unite'  " Use unite.vim
        " nnoremap <silent> [omnisharp]t :OmniSharpFindType<cr>
        " nnoremap <silent> [omnisharp]s :OmniSharpFindSymbol<cr>
        " nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
        " vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr>
    endif
" }

" Grepper {
    if dein#tap('vim-grepper')
        " Mimic :grep and make ag the default tool.
        let g:grepper = {
            \ 'tools': ['rg', 'ag', 'git','grep'],
            \ }
        nnoremap [grepper] <nop>
        nmap <leader>/ [grepper]
        nnoremap <silent> [grepper] :Grepper -cword -noprompt<cr>
    endif
" }

" Denite {
    if dein#tap('denite.nvim')
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
            call denite#custom#var('grep', 'default_opts',
                        \ ['-i', '--vimgrep'])
            call denite#custom#var('grep', 'recursive_opts', [])
            call denite#custom#var('grep', 'pattern_opt', [])
            call denite#custom#var('grep', 'separator', ['--'])
            call denite#custom#var('grep', 'final_opts', [])
        " }

        " custom mappings {
            nnoremap [denite] <nop>
            nmap <leader>u [denite]
            nnoremap <silent> [denite]p :Denite file_rec<cr>
            nnoremap <silent> [denite]r :Denite file_mru<cr>
            nnoremap <silent> [denite]b :Denite buffer<cr>
            nnoremap <silent> [denite]m :Denite menu<cr>
            nnoremap <silent> [denite]g :Denite grep<cr>
            nnoremap <silent> [denite]l :Denite line<cr>
            nnoremap <silent> [denite]y :Denite neoyank<cr>
            nnoremap <silent> [denite]d :Denite dein<cr>
            nnoremap <silent> [denite]h :Denite help<cr>
            nnoremap <silent> [denite]c :Denite colorscheme<cr>
            nnoremap <silent> [denite]f :<C-u>DeniteCursorWord grep:.<CR>

            call denite#custom#map('insert', '<c-k>', '<denite:move_to_previous_line>', 'noremap')
            call denite#custom#map('insert', '<c-j>', '<denite:move_to_next_line>', 'noremap')
            call denite#custom#map('insert', '<c-r>', '<denite:redraw>', 'noremap')
        " }
    endif
" }

" Bufkill {
    if dein#tap('vim-bufkill')
        let g:BufKillCreateMappings = 0
        nnoremap <silent> [buffer], :BD<cr>
    endif
" }

" Tern {
    if dein#tap('deoplete-ternjs')
        " echo 'deoplete_ternjs'
        " let g:tern_request_timeout = 1
        " let g:tern_map_keys=1

        " let g:deoplete#sources#ternjs#types = 1
        " let g:deoplete#sources#ternjs#depths = 1
        " let g:deoplete#sources#ternjs#docs = 1
        " let g:deoplete#sources#ternjs#filter = 0
        " let g:deoplete#sources#ternjs#case_insensitive = 1
        " let g:deoplete#sources#ternjs#include_keywords = 1
        " let g:deoplete#sources#ternjs#in_literal = 0
        " let g:deoplete#sources#ternjs#filetypes = [
        "     \ 'jsx',
        "     \ 'javascript.jsx',
        "     \ 'vue',
        "     \ ]
    endif

    if dein#tap('tern_for_vim')
        " echo 'tern_for_vim'
        let g:tern#command = ['tern']
        let g:tern#arguments = ['--persistent']
        let g:tern_show_argument_hints = 'on_hold'
        let g:tern_show_signature_in_pum = 1
        autocmd FileType javascript,javascript.jsx setlocal omnifunc=tern#Complete
    endif
" }

" context-commentstring {
    if dein#tap('vim-context-commentstring')
        let g:context#commentstring#table['javascript.jsx'] = {
                    \ 'jsComment' : '// %s',
                    \ 'jsImport' : '// %s',
                    \ 'jsxStatment' : '// %s',
                    \ 'jsxRegion' : '{/*%s*/}',
                    \}
    endif
" }
