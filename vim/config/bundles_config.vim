" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:

" Notes {
" Personal vimrc of Mario Carballo Zama
" [afk] https://ellugar.co
" This should handle all plugins config
" }

" Languages {
" if dein#tap('vim-polyglot')
" let g:polyglot_disabled = ['css']
" JSX {
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
" }

" Markdown {
let g:vim_markdown_conceal = 0
" }

" Rust {
let g:formatdef_rustfmt='"rustfmt"'
let g:formatters_rust=['rustfmt']
let g:rustfmt_autosave = 1
let g:racer_cmd=expand('~/.cargo/bin/racer')
" }
" endif
" }

" Ale {
let g:ale_sign_column_always = 1
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_fix_on_save = 1

let g:ale_linters = {}
let g:ale_linters['javascript'] = ['eslint']
let g:ale_linters['graphql'] = ['']
let g:ale_linters['python'] = ['flake8']
let g:ale_linters['rust'] = ['cargo']
let g:ale_linters['go'] = ['gometalinter', 'gofmt']
let g:ale_linters['cs'] = ['OmniSharp']

let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier', 'eslint']
let g:ale_fixers['graphql'] = ['prettier']
let g:ale_fixers['json'] = ['prettier']
let g:ale_fixers['css'] = ['prettier']
let g:ale_fixers['scss'] = ['prettier']
let g:ale_fixers['yaml'] = ['prettier']
let g:ale_fixers['python'] = ['isort', 'black']
let g:ale_fixers['rust'] = ['rustfmt']
let g:ale_fixers['sh'] = ['shfmt']
let g:ale_fixers['go'] = ['gofmt', 'goimports']
let g:ale_fixers['sql'] = ['pgformatter']
let g:ale_fixers['c'] = ['clang-format']


nnoremap [ale] <nop>
nmap <leader>a [ale]
nnoremap <silent> [ale]f :ALEFix<cr>
nnoremap <silent> [ale]j :ALENext<cr>
nnoremap <silent> [ale]k :ALEPrevious<cr>
" }

" Emmet {
" if dein#tap('emmet-vim')
" let g:user_emmet_install_global = 0
" autocmd FileType html,css,jsx,js EmmetInstall
iabbrev </ </<C-X><C-O>
let g:user_emmet_settings = {
            \  'javascript' : {
            \      'extends' : 'jsx',
            \  },
            \}
" endif
" }

" Flagship {
" if dein#tap('vim-flagship')
autocmd User Flags call Hoist("window", "SyntasticStatuslineFlag")
" autocmd User Flags call Hoist("global", "%{&ignorecase ? '[IC]' : ''}")
set title titlestring=%{getcwd()}
let g:tabprefix = '[afk]'
let g:tablabel =
            \ "%N%{flagship#tabmodified()} %{flagship#tabcwds('shorten',',')}"

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? '' : printf(
                \ 'w.%d e.%d |',
                \ l:all_non_errors,
                \ l:all_errors
                \)
endfunction


function! GitInfo()
    let git = fugitive#head()
    let info = ''
    if git !=# ''
        let info='g.' . git . ' |'
    endif
    return info
endfunction

set statusline=
set statusline+=%2*
set statusline+=\ b.%n
set statusline+=\ %*
set statusline+=\ %f
set statusline+=\ %*


set statusline+=%=
" Git integration
" if dein#tap('vim-fugitive')
set statusline+=\ %{GitInfo()}
" endif
set statusline+=\ f.%y
set statusline+=\ \|
set statusline+=\ %{LinterStatus()}
set statusline+=\ l.%l
set statusline+=\ c.%c
set statusline+=\ \|
set statusline+=\ %P
set statusline+=\ %*

let g:flagship_skip = 'fugitive#statusline\|FugitiveStatusline'

" endif
" }

" Deoplete {
" if dein#tap('deoplete.nvim')
set completeopt+=noselect
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']


call deoplete#custom#option({
            \ 'auto_complete_delay': 0,
            \ 'smart_case': v:true,
            \ })

call deoplete#custom#option('sources', {
            \ 'cs': ['cs', 'ultisnips', 'file', 'buffer'],
            \ 'python': ['jedi', 'ultisnips', 'file', 'buffer'],
            \ 'javascript.jsx': ['tern', 'ultisnips', 'buffer'],
            \})

call deoplete#custom#option('omni_patterns', {
            \ 'cs': '\w*',
            \ 'rust': '[(\.)(::)]',
            \ 'go': '[^. *\t]\.\w*',
            \})

call deoplete#custom#source('_', 'min_pattern_length', 1)
call deoplete#custom#source('buffer', 'mark', '[b]')
call deoplete#custom#source('tern', 'mark', '[js]')
call deoplete#custom#source('omni', 'mark', '[⌾]')
call deoplete#custom#source('file', 'mark', '[f]')
call deoplete#custom#source('jedi', 'mark', '[j]')
call deoplete#custom#source('ultisnips', 'mark', '[u]')

" For completition coc.nvim or dein.nvim
function! s:check_back_space() abort
    let l:col = col('.') - 1
    return l:col || getline('.')[l:col - 1]  =~# '\s'
endfunction

" Use Tab
imap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ deoplete#mappings#manual_complete()


" Close window on finish
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

au BufNewFile,BufRead *.{stylus,styl} set ft=stylus.css

" aug omnicomplete
"     au!
"     au FileType css,sass,scss,stylus,less setl omnifunc=csscomplete#CompleteCSS
"     au FileType html,htmldjango,jinja,markdown setl omnifunc=emmet#completeTag
"     au FileType python setl omnifunc=pythoncomplete#Complete
"     au FileType xml setl omnifunc=xmlcomplete#CompleteTags
"     au FileType javascript,javascript.jsx setl omnifunc=javascriptcomplete#CompleteJS
" aug END

" endif
" }

" UltiSnips {
" if dein#tap('ultisnips')
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
" endif
" }

" Fugitive {
" if dein#tap('vim-fugitive')
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
" endif
"}

" Obsession {
" if dein#tap('vim-obsession')
set statusline+=%{ObsessionStatus()}     " ObsessionStatus
" endif
"}

" indent_guides {
" if dein#tap('indentLine')
let g:indentLine_char = '│'
let g:indentLine_first_char = '│'
let g:indentLine_showFirstIndentLevel = 1
" endif
" }

" Bufkill {
" if dein#tap('vim-bufkill')
let g:BufKillCreateMappings = 0
nnoremap <silent> [buffer], :BD<cr>
" endif
" }

" FZF {
nnoremap [fzf] <nop>
nmap <leader>u [fzf]
nnoremap <silent> [fzf]p :Files<cr>
nnoremap <silent> [fzf]b :Buffers<cr>
nnoremap <silent> [fzf]g :Rg<cr>
nnoremap <silent> [fzf]l :Lines<cr>
nnoremap <silent> [fzf]c :Colors<cr>
nnoremap <silent> [fzf]r :History<cr>
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'
let g:fzf_history_dir = '~/.local/share/fzf-history'
"
