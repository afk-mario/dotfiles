" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:

" Notes {
" Personal vimrc of Mario Carballo Zama
" [afk] https://ellugar.co
" This should handle all plugins config
" }

" Polyglot {
" let g:polyglot_disabled = ['css']
" Markdown {
" }
" }

" Ale {

" GDScript {
function! FormatGd(buffer) abort
    return {
    \   'command': 'gdformat -l 80 -'
    \}
endfunction

execute ale#fix#registry#Add('gdformat', 'FormatGd', ['gdscript'], 'gdformat for gdscript')
" }

let g:ale_sign_column_always = 1
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_fix_on_save = 1

let g:ale_linters = {}
let g:ale_linters['javascript'] = ['eslint']
let g:ale_linters['javascriptreact'] = ['eslint']
let g:ale_linters['graphql'] = ['']
let g:ale_linters['python'] = ['flake8']
let g:ale_linters['rust'] = ['cargo']
let g:ale_linters['go'] = ['gometalinter', 'gofmt']
let g:ale_linters['cs'] = ['OmniSharp']
let g:ale_linters['lua'] = ['luac']

let g:ale_linters_ignore = {}
let g:ale_linters_ignore['json'] = ['eslint']

let g:ale_fixers = {}
let g:ale_fixers['*'] = ['remove_trailing_lines', 'trim_whitespace']
let g:ale_fixers['javascript'] = ['prettier', 'eslint']
let g:ale_fixers['javascriptreact'] = ['prettier', 'eslint']
let g:ale_fixers['graphql'] = ['prettier']
let g:ale_fixers['json'] = ['prettier']
let g:ale_fixers['css'] = ['prettier']
let g:ale_fixers['html'] = ['prettier']
let g:ale_fixers['md'] = ['prettier']
let g:ale_fixers['scss'] = ['prettier']
let g:ale_fixers['yaml'] = ['prettier']
let g:ale_fixers['python'] = ['isort', 'black']
let g:ale_fixers['rust'] = ['rustfmt']
let g:ale_fixers['sh'] = ['shfmt']
let g:ale_fixers['go'] = ['gofmt']
let g:ale_fixers['sql'] = ['pgformatter']
let g:ale_fixers['c'] = ['clang-format']
let g:ale_fixers['lua'] = ['lua-format']
let g:ale_fixers['gdscript'] = ['gdformat']


nnoremap [ale] <nop>
nmap <leader>a [ale]
nnoremap <silent> [ale]f :ALEFix<cr>
nnoremap <silent> [ale]j :ALENext<cr>
nnoremap <silent> [ale]k :ALEPrevious<cr>
" }

" Emmet {
" let g:user_emmet_install_global = 0
" autocmd FileType html,css,jsx,js EmmetInstall
iabbrev </ </<C-X><C-O>
let g:user_emmet_settings = {
            \  'javascript' : {
                \      'extends' : 'jsx',
                \  },
                \}
" }

" Flagship {
autocmd User Flags call Hoist("window", "SyntasticStatuslineFlag")
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
    let git = FugitiveHead()
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

" }

" Fugitive {
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
"}

" indent_guides {
" let g:indentLine_char = '│'
" let g:indentLine_showFirstIndentLevel = 1
" let g:vim_markdown_conceal = 0
" let g:vim_markdown_conceal_code_blocks = 0
" let g:vim_json_syntax_conceal = 0
" }

" Bufkill {
let g:BufKillCreateMappings = 0
nnoremap <silent> [buffer], :BD<cr>
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
" }

" Dispatch {
nmap <leader>r :Make!<cr>
nmap <leader>R :Make<cr>
" }
