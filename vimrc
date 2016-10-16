" Notes {
" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:
    " Personal vimrc of Mario Carballo Zama
    " Arlefreak
    " AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
    " AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
    " AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
    " AAAAAAAAAAA~                     AAAAAA
    " AAAAAAAAAAAAA          .AAAAA.   AAAAAA
    " AAAAAA AAAAAAAA       .AAAAAAA.  AAAAAA
    " AAAAAA  DAAAAAAA      .AAAAAAA.  AAAAAA
    " AAAAAA    AAAAAAAA     AAAAAAA   AAAAAA
    " AAAAAA     IAAAAAAAO    AAAAA    AAAAAA
    " AAAAAA       DAAAAAAA            AAAAAA
    " AAAAAA         AAAAAAAD          AAAAAA
    " AAAAAA          AAAAAAAA         AAAAAA      arlefreak.com
    " AAAAAAAAAAAAAAAAAAAAAAAAAA       AAAAAA
    " AAAAAAAAAAAAAAAAAAAAAAAAAAAD     AAAAAA
    " AAAAAAAAAAAAAAAAAAAAAAAAAAAAA    AAAAAA
    " AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA  AAAAAA
    " AAAAAA                  AAAAAAAA AAAAAA
    " AAAAAA                    AAAAAAAAAAAAA
    " AAAAAA                      AAAAAAAAAAA
    " AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
    " AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
    " AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
" }

" Environment {
    " Identify platform {
        silent function! OSX()
            return has('macunix')
        endfunction
        silent function! LINUX()
            return has('unix') && !has('macunix') && !has('win32unix')
        endfunction
        silent function! WINDOWS()
            return  (has('win32') || has('win64'))
        endfunction
    " }

    " Basics {
        set nocompatible        " Must be first line
        if !WINDOWS()
            set shell=/bin/sh
        endif
    " }

    " Windows Compatible {
        " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
        " across (heterogeneous) systems easier.
        if WINDOWS()
            set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
        endif
    " }
    
    " Arrow Key Fix {
        if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
            inoremap <silent> <C-[>OC <RIGHT>
        endif
    " }
" }

" Bundles {
    " Config {
        set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim
        call dein#begin(expand('~/.vim/bundle'))
        call dein#add('Shougo/dein.vim')
        " }
    " Unite {
        call dein#add('Shougo/unite.vim', {'lazy': 1})
        call dein#add('arlefreak/vim-unite-config', { 
                    \'depends': 'unite.vim'
                    \})
        call dein#add('Shougo/neomru.vim', {
                    \'depends': 'unite.vim'
                    \})
        call dein#add('Shougo/unite-outline', {
                    \'depends': 'unite.vim'
                    \})
        call dein#add('Shougo/neoyank.vim', {
                    \'depends': 'unite.vim'
                    \})
        call dein#add('tacroe/unite-mark', {
                    \'depends': 'unite.vim'
                    \})
        call dein#add('tsukkee/unite-tag', {
                    \'depends': 'unite.vim'
                    \})
    " }
    " Utilities{
        call dein#add('Shougo/vimproc.vim', {'build': 'make'})
        call dein#add('tpope/vim-dispatch') " Asynchronous build and test dispatcher
        call dein#add('Shougo/deoplete.nvim')
        call dein#add('editorconfig/editorconfig-vim')
        call dein#add('tpope/vim-vinegar')                            " Netrw helper
        call dein#add('tpope/vim-obsession')                          " Session Managment
        call dein#add('tpope/vim-eunuch')                             " Unix helpers
        call dein#add('tpope/vim-commentary')                         " Toggle comments
        call dein#add('tpope/vim-surround')                           " Sorroundings
        call dein#add('tpope/vim-repeat')                             " More . command
        call dein#add('tommcdo/vim-exchange')                         " Exchange motion
        call dein#add('SirVer/ultisnips')                             " Snippets
        call dein#add('honza/vim-snippets')
        call dein#add('wellle/targets.vim')                           " Better motions
        " call dein#add('scrooloose/syntastic')                        " Syntax check
        call dein#add('Konfekt/FastFold')                             " Fast Fold for deoplete
        call dein#add('neomake/neomake')                              " Async Syntax check
        call dein#add('Raimondi/delimitMate')                        " Auto close quotes parentesis etc
        call dein#add('mhinz/vim-grepper')                            " Multiple grep support
        call dein#add('sjl/gundo.vim')                               " Undo tree
        call dein#add('Chiel92/vim-autoformat')                       " AutoFormat code
        call dein#add('mhinz/vim-startify')                           " Start Screen
        call dein#add('godlygeek/tabular')                            " Align code
        call dein#add('wakatime/vim-wakatime')                        " register time 
    " }
    " Prose {
        call dein#add('reedes/vim-pencil', {'lazy': 1})                            " Better Writting
        call dein#add('junegunn/goyo.vim', {'lazy': 1})
    " }
    " VCS {
        call dein#add('tpope/vim-fugitive')                           " Git wrapper
        " call dein#add('airblade/vim-gitgutter')                       " Git gutter simbols
        " call dein#add('mhinz/vim-signify')
    " }
    " Languages {
        call dein#add('rust-lang/rust.vim', {
                    \ 'on_ft' : 'rust'
                    \ })
        call dein#add('racer-rust/vim-racer', {
                    \ 'on_ft' : 'rust'
                    \ })
        call dein#add('cespare/vim-toml', {
                    \ 'on_ft': 'toml'
                    \ })
        call dein#add('mattn/emmet-vim', {
                    \ })
        call dein#add('othree/html5.vim', {
                    \ 'on_ft': 'toml'
                    \ })
        call dein#add('elzr/vim-json', {
                    \ 'on_ft': 'json'
                    \ })
        call dein#add('pangloss/vim-javascript', {
                    \ 'on_ft': ['javascript', 'javascript.jsx']
                    \ })
        call dein#add('mxw/vim-jsx', {
                    \ 'on_ft': ['javascript', 'javascript.jsx']
                    \ })
        call dein#add('wavded/vim-stylus', {
                    \ })
        call dein#add('klen/python-mode', {
                    \ 'on_ft': 'python'
                    \ })
        call dein#add('davidhalter/jedi-vim', {
                    \ 'on_ft': 'python'
                    \ })
        call dein#add('vim-scripts/django.vim', {
                    \ 'on_ft': 'python'
                    \ })
        if OSX()
            call dein#add('OmniSharp/omnisharp-vim', {
                        \ 'build': 'sh -c "cd server/ && xbuild"',
                        \ 'on_ft': 'cs'
                        \ })
            call dein#add('OrangeT/vim-csharp', {
                        \ 'on_ft': 'cs'
                        \ })
            call dein#add('https://gitlab.com/mixedCase/deoplete-omnisharp.git', {
                        \ 'on_ft': 'cs'
                        \ })
        endif
        call dein#add('jdonaldson/vaxe', {
                    \ 'on_ft': 'haxe'
                    \ })
    " }
    " Vim UI {
        call dein#add('tpope/vim-flagship')                           " Statusline
        call dein#add('nathanaelkane/vim-indent-guides')             " Ident visual guide
        call dein#add('gregsexton/MatchTag')                         " Highlite Matching tag
        call dein#add('altercation/vim-colors-solarized')
        call dein#add('w0ng/vim-hybrid')
        call dein#add('whatyouhide/vim-gotham')
        call dein#add('morhetz/gruvbox')
    " }

    call dein#end()

    if dein#check_install()
      call dein#install()
    endif
    call dein#check_lazy_plugins()
    call dein#save_state()
" }

" General {
    set background=dark
    filetype plugin indent on   " Automatically detect file types.
    syntax on                   " Syntax highlighting
    set mouse=a                 " Automatically enable mouse usage
    set mousehide               " Hide the mouse cursor while typing
    set complete-=i             " Complete only on current buffer http://stackoverflow.com/questions/2169645/vims-autocomplete-is-excruciatingly-slow
    set nrformats-=octal        " Ctrl A considers numbers starting with 0 octal
    set autoread
    scriptencoding utf-8

    autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif " Always switch to the current file directory

    if has('clipboard')
        if has('unnamedplus')  " When possible use + register for copy-paste
            set clipboard=unnamed,unnamedplus
        else         " On mac and Windows, use * register for copy-paste
            set clipboard=unnamed
        endif
    endif

    "set autowrite                       " Automatically write a file when leaving a modified buffer
    set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
    set virtualedit=onemore             " Allow for cursor beyond last character
    set history=1000                    " Store a ton of history (default is 20)
    " set spell                           " Spell checking on
    " set spell spelllang=es_es
    set hidden                          " Allow buffer switching without saving
    set iskeyword-=.                    " '.' is an end of word designator
    set iskeyword-=#                    " '#' is an end of word designator
    set iskeyword-=-                    " '-' is an end of word designator

    function! ResCur()
    if line("'\"") <= line("$")
      silent! normal! g`"
      return 1
    endif
    endfunction

    augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
    augroup END

    set backup                  " Backups are nice ...
    if has('persistent_undo')
        set undofile                " So is persistent undo ...
        set undolevels=1000         " Maximum number of changes that can be undone
        set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
    endif

    let loaded_matchparen = 1
" }

" Vim GUI {

    if has('gui_running')
        set guioptions-=T           " Remove the toolbar
        set lines=40                " 40 lines of text instead of 24
    else
        if &term == 'xterm' || &term == 'screen'
            set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
        endif
    endif

    if has('nvim')
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif

    if has('termguicolors')
        set termguicolors
    endif


    if OSX() && filereadable(expand("~/.vim/bundle/repos/github.com/morhetz/gruvbox/colors/gruvbox.vim"))
        colorscheme gruvbox
    elseif OSX() && filereadable(expand("~/.cache/dein/repos/github.com/whatyouhide/vim-gotham/colors/gotham.vim"))
        colorscheme gotham
    elseif filereadable(expand("~/.vim/bundle/vim-hybrid/colors/hybrid.vim"))
        let g:hybrid_custom_term_colors = 1
        colorscheme hybrid
    elseif  filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
        let g:solarized_termcolors=256
        let g:solarized_termtrans=1
        let g:solarized_contrast="normal"
        let g:solarized_visibility="normal"
        colorscheme solarized             " Load a colorscheme
    endif

    highlight clear SignColumn      " SignColumn should match background
    highlight clear LineNr          " Current line number row will have same background color in relative mode

    if has('cmdline_info')
        set ruler                   " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
        set showcmd                 " Show partial commands in status line and
    endif

    if has('statusline')
        set laststatus=2
        set showtabline=2
        set guioptions-=e
        set statusline=%t       "tail of the filename

        if !dein#tap("vim-flagship")
            set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
            set statusline+=%{&ff}] "file format
            set statusline+=%h      "help file flag
            set statusline+=%m      "modified flag
            set statusline+=%r      "read only flag
            set statusline+=%y      "filetype
            set statusline+=%=      "left/right separator
            set statusline+=%c,     "cursor column
            set statusline+=%l/%L   "cursor line/total lines
            set statusline+=\ %P    "percent through file

            set statusline+=%#warningmsg#
            set statusline+=%*
            if version >= 700
              au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
              au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
            endif
        endif
    endif

    set tabpagemax=15               " Only show 15 tabs
    set noshowmode
    set cursorline                  " Highlight current line
    set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set number                      " line numbers on
    set relativenumber
    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set winminheight=0              " Windows can be 0 line high
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    set wildmenu                    " Show list instead of just completing
    set wildmode=longest:full,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    set scrolljump=5                " Lines to scroll when cursor leaves screen
    set scrolloff=3                 " Minimum lines to keep above and below cursor
    set display+=lastline
    set foldenable                  " Auto fold code
    set list
    set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
    set fillchars=vert:│,fold:-
    highlight VertSplit cterm=none ctermbg=none ctermfg=247

    " Netrw {
        let g:netrw_altv = 1
        let g:netrw_banner = 0
        let g:netrw_winsize = -28
        let g:netrw_liststyle = 3
        let g:netrw_preview   = 1
        let g:netrw_winsize   = 20
        let g:netrw_browse_split = 4
        let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro rnu'  " --> I want line numbers on the netrw buffer
    " }
" }

" Formatting {
    set wrap                        " wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
    set smarttab                    " Smart tab actions
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current
    "set matchpairs+=<:>             " Match, to be used with %
    set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
" }

" Key (re)Mappings {
    let mapleader="\<Space>"
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
        nnoremap <silent> [spell]g :setlocal spell spelllang=en_en<cr>
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
" }

" Plugins {
    " Gundo {
        if dein#tap("gundo.vim")
            let g:gundo_prefer_python3 = 1
            nnoremap <leader>g :GundoToggle<CR>
        endif
    " }

    " Tabular {
        if dein#tap("tabular")
            nmap <Leader>a& :Tabularize /&<CR>
            vmap <Leader>a& :Tabularize /&<CR>
            nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
            vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
            nmap <Leader>a1= :Tabularize 1=<CR>
            nmap <Leader>a=> :Tabularize /=><CR>
            vmap <Leader>a=> :Tabularize /=><CR>
            nmap <Leader>a: :Tabularize /:<CR>
            vmap <Leader>a: :Tabularize /:<CR>
            nmap <Leader>a:: :Tabularize /:\zs<CR>
            vmap <Leader>a:: :Tabularize /:\zs<CR>
            nmap <Leader>a, :Tabularize /,<CR>
            vmap <Leader>a, :Tabularize /,<CR>
            nmap <Leader>a,, :Tabularize /,\zs<CR>
            vmap <Leader>a,, :Tabularize /,\zs<CR>
            nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
            vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
        endif
    "}

    " JSBeutifier {
        
        if dein#tap("js-beautify")
            autocmd FileType javascript noremap <buffer><leader>jb :call JsBeautify()<cr>
            autocmd FileType html noremap <buffer><leader>jb :call HtmlBeautify()<cr>
            autocmd FileType css noremap <buffer><leader>jb :call CSSBeautify()<cr>
        endif
    " }

    " Syntastic {
        if dein#tap("syntastic")
            let g:syntastic_always_populate_loc_list = 1
            let g:syntastic_auto_loc_list = 1
            let g:syntastic_check_on_open = 0
            let g:syntastic_check_on_wq = 0

            set statusline+=%{SyntasticStatuslineFlag()}

            let g:syntastic_mode_map = { 'mode': 'active',
                \ 'active_filetypes': [],
                \ 'passive_filetypes': ['html'] }
            let g:syntastic_javascript_checkers = ['eslint']
        endif
    " }

    " NeoMake {
        if dein#tap("neomake")
            autocmd! BufWritePost,BufEnter * Neomake
            let g:neomake_javascript_enabled_makers = ['eslint']
            if findfile('.eslintrc', '.;') ==# ''
                let g:neomake_javascript_enabled_makers = ['standard']
            endif

            nnoremap [neomake] <nop>
            nmap <leader>c [neomake]
            nnoremap <silent> [neomake]o :lopen<cr>
            nnoremap <silent> [neomake]c :lclose<cr>
            nnoremap <silent> [neomake], :ll<cr>
            nnoremap <silent> [neomake]l :lnext<cr>
            nnoremap <silent> [neomake]h :lprev<cr>
        endif
    " }

    " NeoMake {
    " }

    " Emmet {
        if dein#tap("emmet-vim")
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

    " Vim-airline {
        if dein#tap("vim-airline")
            set laststatus=2
            let g:airline_theme='gotham'
            let g:airline_detect_paste=1
            let g:Powerline_symbols = 'fancy'"
            let g:airline_powerline_fonts = 1
            let g:airline#extensions#tabline#enabled = 1
            let g:airline#extensions#tabline#fnamemod = ':t'
            let g:airline#extensions#tabline#left_sep = ' '
            let g:airline#extensions#tabline#left_alt_sep = '░'
            " Disable powerline arrows and setting blank seperators creates a rectangular box
            let g:airline_left_sep = '█▓░'
            let g:airline_right_sep = '░▓█'
            let g:airline_section_z = airline#section#create(['%{ObsessionStatus(''$'', '''')}', 'windowswap', '%3p%% ', 'linenr', ':%3v '])
            let g:airline_section_c = airline#section#create([''])
        endif
    " }

    " Flagship {
        if dein#tap("vim-flagship")
            autocmd User Flags call Hoist("window", "SyntasticStatuslineFlag")
            autocmd User Flags call Hoist("global", "%{&ignorecase ? '[IC]' : ''}")
        endif
    " }

    " Tmux-Line {
        
        if dein#tap("tmuxline.vim")
            " let g:tmuxline_theme = 'iceberg'
        endif
    " }

    " Deoplete {
        if dein#tap("deoplete.nvim")
            let g:deoplete#enable_at_startup = 1
            let g:deoplete#enable_smart_case = 1

            imap <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ deoplete#mappings#manual_complete()

            function! s:check_back_space() abort
                let col = col('.') - 1
                return !col || getline('.')[col - 1]  =~ '\s'
            endfunction

            " Close window on finish
            autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif


            au BufNewFile,BufRead *.{stylus,styl} set ft=stylus.css
            let g:deoplete#omni_patterns = {}

            let g:deoplete#omni_patterns.rust = '[(\.)(::)]'

            aug omnicomplete
                au!
                au FileType css,sass,scss,stylus,less setl omnifunc=csscomplete#CompleteCSS
                au FileType html,htmldjango,jinja,markdown setl omnifunc=emmet#completeTag
                au FileType python setl omnifunc=pythoncomplete#Complete
                au FileType xml setl omnifunc=xmlcomplete#CompleteTags
            aug END

            " Omnisharp Settings {
                " Define dictionary 
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
            " }
        endif
    " }

    " NeoSnippet {
        if dein#tap("neosnippet.vim")
            " Plugin key-mappings.
            imap <C-k>     <Plug>(neosnippet_expand_or_jump)
            smap <C-k>     <Plug>(neosnippet_expand_or_jump)
            xmap <C-k>     <Plug>(neosnippet_expand_target)

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
        endif
    " }

    " UltiSnips {
        if dein#tap("ultisnips")
            let g:UltiSnipsExpandTrigger="<c-k>"
            let g:UltiSnipsJumpForwardTrigger="<c-b>"
            let g:UltiSnipsJumpBackwardTrigger="<c-z>"
            " If you want :UltiSnipsEdit to split your window.
            let g:UltiSnipsEditSplit="vertical"
            let g:UltiSnipsSnippetsDir="~/.vim/UltiSnipps/"
            let g:UltiSnipsSnippetDirectories = ["UltiSnips", "snips"]
            " Use Python Version
            let g:UltiSnipsUsePythonVersion = 3
            let g:ultisnips_python_style="google"
        endif
    " }

    " Rust {
        if dein#tap("rust.vim")
            " let g:rustfmt_autosave = 1
            nmap <leader>f :Autoformat<cr>
            let g:formatdef_rustfmt = '"rustfmt"'
            let g:formatters_rust = ['rustfmt']
            let g:racer_cmd = expand("~/.cargo/bin/racer")
            let $RUST_SRC_PATH= expand("~/.rust/src/")
        endif
    " }

    " PyMode {
        " Disable if python support not present
        if !has('python') && !has('python3')
            let g:pymode = 0
        endif

        if dein#tap("python-mode")
            let g:pymode_rope_completion_bind = ''
            let g:pymode_breakpoint_bind = ''
            let g:pymode_lint_checkers = ['pyflakes']
            let g:pymode_trim_whitespaces = 0
            let g:pymode_options = 0
            let g:pymode_rope = 0
        endif
    " }

    " Fugitive {
        if dein#tap("vim-fugitive")
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
            if !dein#tap("vim-flagship")
                set statusline+=%{fugitive#statusline()} " Git integration
            endif
        endif
    "}

    " Obsession {
        if dein#tap("vim-obsession")
            set statusline+=%{ObsessionStatus()}     " ObsessionStatus
        endif
    "}

    " indent_guides {
        if dein#tap("vim-ident-guides")
            let g:indent_guides_start_level = 2
            let g:indent_guides_guide_size = 1
            let g:indent_guides_enable_on_vim_startup = 1
        endif
    " }

    " Startify {
        if dein#tap("vim-startify")
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
            " let g:startify_custom_footer = [
            "             \' ',
            "             \'   AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
            "             \'   AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
            "             \'   AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
            "             \'   AAAAAAAAAAA~                     AAAAAA',
            "             \'   AAAAAAAAAAAAA          .AAAAA.   AAAAAA',
            "             \'   AAAAAA AAAAAAAA       .AAAAAAA.  AAAAAA',
            "             \'   AAAAAA  DAAAAAAA      .AAAAAAA.  AAAAAA',
            "             \'   AAAAAA    AAAAAAAA     AAAAAAA   AAAAAA',
            "             \'   AAAAAA     IAAAAAAAO    AAAAA    AAAAAA',
            "             \'   AAAAAA       DAAAAAAA            AAAAAA',
            "             \'   AAAAAA         AAAAAAAD          AAAAAA',
            "             \'   AAAAAA          AAAAAAAA         AAAAAA      arlefreak.com',
            "             \'   AAAAAAAAAAAAAAAAAAAAAAAAAA       AAAAAA',
            "             \'   AAAAAAAAAAAAAAAAAAAAAAAAAAAD     AAAAAA',
            "             \'   AAAAAAAAAAAAAAAAAAAAAAAAAAAAA    AAAAAA',
            "             \'   AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA  AAAAAA',
            "             \'   AAAAAA                  AAAAAAAA AAAAAA',
            "             \'   AAAAAA                    AAAAAAAAAAAAA',
            "             \'   AAAAAA                      AAAAAAAAAAA',
            "             \'   AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
            "             \'   AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
            "             \'   AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
            " \]
        endif
    " }

    " Ctags {
        set tags=./tags;/,~/.vimtags

        " Make tags placed in .git/tags file available in all levels of a repository
        let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
        if gitroot != ''
            let &tags = &tags . ',' . gitroot . '/.git/tags'
        endif
    " }

    " Goyo and Limelight {
        if dein#tap("goyo.vim")
            " let g:goyo_margin_top=0
            " let g:goyo_margin_bottom=0
            nnoremap <leader>G :Goyo<CR>
        endif
    " }

    " OmniSharp {
        if dein#tap("OmniSharp.vim")
            let g:OmniSharp_selector_ui = 'unite'  " Use unite.vim

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
        endif
    " }

    " Grepper {
        if dein#tap("vim-grepper")
            " Mimic :grep and make ag the default tool.
            let g:grepper = {
                \ 'tools': ['rg', 'ag', 'git','grep'],
                \ }
        endif
    " }
" }

" Functions {
    " Initialize directories {
        function! InitializeDirectories()
            let parent = $HOME
            let prefix = 'vim'
            let dir_list = {
                        \ 'backup': 'backupdir',
                        \ 'views': 'viewdir',
                        \ 'swap': 'directory' }

            if has('persistent_undo')
                let dir_list['undo'] = 'undodir'
            endif

            let common_dir = parent . '/.' . prefix

            for [dirname, settingname] in items(dir_list)
                let directory = common_dir . dirname . '/'
                if exists("*mkdir")
                    if !isdirectory(directory)
                        call mkdir(directory)
                    endif
                endif
                if !isdirectory(directory)
                    echo "Warning: Unable to create backup directory: " . directory
                    echo "Try: mkdir -p " . directory
                else
                    let directory = substitute(directory, " ", "\\\\ ", "g")
                    exec "set " . settingname . "=" . directory
                endif
            endfor
        endfunction
        call InitializeDirectories()
    " }
    " Create dir new buffers {
        function! <SID>AutoMkdir() abort
        let l:dir = expand('<afile>:p:h')
        if !isdirectory(l:dir)
            echohl WarningMsg
            let l:ans = input(l:dir . ' does not exist, create it [Y/n]? ')
            echohl None
            if empty(l:ans) || l:ans ==# 'y'
                call mkdir(l:dir, 'p')
            endif
        endif
        endfunction
        augroup AutoMkdir
        autocmd!
        autocmd BufWritePre,FileWritePre,BufNewFile *
                    \ call <SID>AutoMkdir()
       augroup END
    " }
" }
