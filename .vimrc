" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
    if &compatible
        set nocompatible               " Be iMproved
    endif

    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" Bundles
" --------------------------------------------------------------------------

" Utilities
NeoBundle 'Shougo/neosnippet.vim'                        " Snippets support
NeoBundle 'Shougo/neosnippet-snippets'                   " Snippets
NeoBundle 'Shougo/unite.vim'                             " Fuzzy file finder
NeoBundle 'Shougo/neocomplete.vim'                       " AutoComplete
NeoBundle 'Shougo/neomru.vim'                            " MRU sources
NeoBundle 'tpope/vim-sensible'                           " Default configs
NeoBundle 'tpope/vim-sleuth'                             " Tab identation settings
NeoBundle 'tpope/vim-vinegar'                            " Netrw helper
NeoBundle 'tpope/vim-eunuch'                             " Unix helpers
NeoBundle 'tpope/vim-unimpaired'                         " BubbleText
NeoBundle 'tpope/vim-commentary'                         " Toggle comments
NeoBundle 'scrooloose/syntastic',                        " Check syntax
NeoBundle 'Raimondi/delimitMate',                        " Auto close quotes parentesis etc
NeoBundle 'sjl/gundo.vim',                               " Undo tree
NeoBundle 'terryma/vim-multiple-cursors'                 " SublimeText multiple cursors
NeoBundle 'vim-scripts/loremipsum'                       " Lorem ipsum text

" Git
NeoBundle 'tpope/vim-fugitive'                           " Git wrapper
NeoBundle 'airblade/vim-gitgutter'                       " Git gutter simbols

                                                         " Web
NeoBundle 'mattn/emmet-vim',                             " Emmet

" Languages and Frameworks
NeoBundle 'elzr/vim-json',                               " JSON plugin
NeoBundle 'pangloss/vim-javascript'                      " Sintax and ident plugins
NeoBundle 'vim-scripts/django.vim'                       " Django plugin
NeoBundle 'wavded/vim-stylus'                            " Stylus plugin
NeoBundle 'othree/html5.vim'                             " Html5 Plugin
NeoBundle 'tpope/vim-markdown'                           " Markdown
NeoBundle 'davidhalter/jedi-vim'                         " Python autocomplete
NeoBundle 'OmniSharp/omnisharp-vim'                      " C# AutoComplete# AutoComplete# AutoComplete
NeoBundle 'OrangeT/vim-csharp'                           " Better C# syntax highlight
NeoBundle 'tpope/vim-dispatch'                           " Asynchronous build and test dispatcher

" Visual
NeoBundle 'godlygeek/tabular'                            " Align code
NeoBundle 'nathanaelkane/vim-indent-guides',             " Ident visual guide
NeoBundle 'gregsexton/MatchTag',                         " Highlite Matching tag
NeoBundle 'bling/vim-airline'                            " Cool airline

" ColorSchemes
NeoBundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'NLKNguyen/papercolor-theme'

NeoBundle 'Shougo/vimproc', {
            \ 'build' : {
            \     'windows' : 'make -f make_mingw32.mak',
            \     'cygwin' : 'make -f make_cygwin.mak',
            \     'mac' : 'make -f make_mac.mak',
            \     'unix' : 'make -f make_unix.mak',
            \    },
            \ }
" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }
call neobundle#end()

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" General
" ---------------------------------------------------------------------
let mapleader=","
set number
set hlsearch
set cursorline

if exists("&undodir")
    set undofile          "Persistent undo! Pure money.
    let &undodir=&directory
    set undolevels=500
    set undoreload=500
endif

" Identation
" ----------------------------------------------------------------------
"set tabstop =4
"set shiftwidth =4
"set softtabstop =4
"set smarttab
"set expandtab

" Colors
" ----------------------------------------------------------------------
set background=dark
"colorscheme Tomorrow-Night-Eighties
"let g:solarized_termcolors = 16
"let g:solarized_termtrans=1
"colorscheme solarized
let g:hybrid_use_Xresources = 1
colorscheme hybrid

" Netrw
" ----------------------------------------------------------------------
let g:netrw_liststyle = 3
let g:netrw_preview   = 1
let g:netrw_winsize   = 20

set splitbelow
set splitright

" Buffer
" ----------------------------------------------------------------------
set hidden
nmap <leader>T  : enew<cr>
nmap <leader>l  : bnext<CR>
nmap <leader>h  : bprevious<CR>
nmap <leader>bq : bp <BAR> bd #<CR>
nmap <leader>bl : ls<CR>
let g:netrw_preview = 1

" Tabs
" ----------------------------------------------------------------------
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

"Gundo
" ----------------------------------------------------------------------
nnoremap <F5> :GundoToggle<CR>

" Unite
" ----------------------------------------------------------------------

let g:unite_source_history_yank_enable = 1
if executable('ag')
    let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
endif

call unite#custom#source('file_rec/async', 'ignore_pattern', '\(png\|gif\|jpeg\|jpg\|meta\|csproj\|booproj\|unityproj\|anim\|controller\|prefab\|unity\|ogg\|mp3\)$')
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>p :<C-u>Unite -buffer-name=files file_rec/async:!<cr>
nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>s :<C-u>Unite -no-split -buffer-name=line    -start-insert line<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

" Syntastic
" ----------------------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Emmet
" ----------------------------------------------------------------------
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set shiftwidth=4
iabbrev </ </<C-X><C-O>

" Xclip
" ----------------------------------------------------------------------
map <F7> :w !xclip<CR><CR>
vmap <F7> "*y
map <S-F7> :r!xclip -o<CR>"

" Vim-airline
" ----------------------------------------------------------------------
""Fixes
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
set encoding=utf-8 " Necessary to show Unicode glyphs
let g:Powerline_symbols = 'fancy'"
let g:airline_powerline_fonts = 1
set laststatus=2
set noshowmode
set t_Co=256

let g:airline_detect_paste=1
let g:airline_theme='badwolf'

" NeoComplete
" ----------------------------------------------------------------------
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplete#close_popup() . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()


" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

" C#

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.cs = '.*[^=\);]'

" Fix extra buffer
set completeopt=menu

" Python
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0

let g:neocomplcache_force_overwrite_completefunc = 1
if !exists('g:neocomplcache_omni_functions')
  let g:neocomplcache_omni_functions = {}
endif
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_overwrite_completefunc = 1
let g:neocomplcache_force_omni_patterns['python'] =
\ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

set ofu=syntaxcomplete#Complete
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python let b:did_ftplugin = 1

" Vim-jedi settings
let g:jedi#popup_on_dot = 0

" NeoSnippet 
" ------------------------------------------------------------------------

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
