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
        call dein#add('Shougo/denite.nvim')
        call dein#add('Shougo/neomru.vim', {
                    \'depends': 'denite.nvim'
                    \})
        call dein#add('Shougo/unite-outline', {
                    \'depends': 'denite.nvim'
                    \})
        call dein#add('Shougo/neoyank.vim', {
                    \'depends': 'denite.nvim'
                    \})
        call dein#add('tacroe/unite-mark', {
                    \'depends': 'denite.nvim'
                    \})
        call dein#add('tsukkee/unite-tag', {
                    \'depends': 'denite.nvim'
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
        call dein#add('tpope/vim-abolish')                            " Better replace
        call dein#add('tpope/vim-unimpaired')                         " Key mappings for [
        call dein#add('tommcdo/vim-exchange')                         " Exchange motion
        call dein#add('AndrewRadev/splitjoin.vim')                    " Split onelinners with gS
        call dein#add('SirVer/ultisnips')                             " Snippets
        call dein#add('honza/vim-snippets')
        call dein#add('wellle/targets.vim')                           " Better motions
        call dein#add('neomake/neomake')                              " Async Syntax check
        call dein#add('Raimondi/delimitMate')                        " Auto close quotes parentesis etc
        call dein#add('mhinz/vim-grepper')                            " Multiple grep support
        call dein#add('sjl/gundo.vim')                               " Undo tree
        call dein#add('mhinz/vim-startify')                           " Start Screen
        call dein#add('godlygeek/tabular')                            " Align code
        call dein#add('vim-scripts/BufOnly.vim')                      " Close All other buffers
        call dein#add('mjbrownie/swapit')                       " Toggle between true false
        if OSX()
            call dein#add('wakatime/vim-wakatime')                        " register time 
        endif
    " }
    " Prose {
        call dein#add('reedes/vim-pencil', {'on_ft': ['markdown', 'text']})
        call dein#add('reedes/vim-lexical', {'on_ft': ['markdown', 'text']})
        call dein#add('reedes/vim-wordy', {'on_ft': ['markdown', 'text']})
        call dein#add('dbmrq/vim-ditto', {'on_ft': ['markdown', 'text']})
        call dein#add('junegunn/goyo.vim', {'on_ft': ['markdown', 'text']})
        call dein#add('junegunn/limelight.vim', {'on_ft': ['markdown', 'text']})
        " call dein#add('reedes/vim-textobj-sentence', {'in_ft': 'markdown'})
    " }
    " VCS {
        call dein#add('tpope/vim-fugitive')                           " Git wrapper
        " call dein#add('airblade/vim-gitgutter')                       " Git gutter simbols
        " call dein#add('mhinz/vim-signify')
    " }
    " Languages {
        call dein#add('sheerun/vim-polyglot',{
                    \})
        call dein#add('rust-lang/rust.vim', {
                    \ })
        call dein#add('racer-rust/vim-racer', {
                    \ })
        call dein#add('cespare/vim-toml', {
                    \ 'on_ft': 'toml'
                    \ })
        call dein#add('mattn/emmet-vim', {
                    \ })
        call dein#add('othree/html5.vim', {
                    \ 'on_ft': 'html'
                    \ })
        call dein#add('elzr/vim-json', {
                    \ 'on_ft': 'json'
                    \ })
        call dein#add('pangloss/vim-javascript', {
                    \ })
        call dein#add('mxw/vim-jsx', {
                    \ })
        call dein#add('jaawerth/nrun.vim', {
                    \ })
        call dein#add('zchee/deoplete-jedi', {
                    \ 'on_ft': 'python'
                    \ })
        call dein#add('vim-scripts/django.vim', {
                    \ 'on_ft': 'python'
                    \ })
        call dein#add('chr4/nginx.vim', {
                    \ })
        if OSX()
            call dein#add('OmniSharp/omnisharp-vim', {
                        \ 'build': 'sh -c "cd server/ && xbuild"',
                        \ 'on_ft': 'cs'
                        \ })
            call dein#add('Robzz/deoplete-omnisharp/',{
                        \ 'on_ft': 'cs',
                        \ 'depends': 'omnisharp-vim'
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
    set wildignore+=*.unitypackage,
    set wildignore+=debug/,
    set wildignore+=Debug/,
    set wildignore+=temp/,
    set wildignore+=Temp/,
    set wildignore+=temp/,
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
        let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
    endif

    if has('termguicolors')
        set termguicolors
    endif

    if dein#tap('gruvbox')
        colorscheme gruvbox
    elseif OSX() && dein#tap('vim-gotham')
        colorscheme gotham
    elseif dein#tap('vim-hybrid')
        let g:hybrid_custom_term_colors = 1
        colorscheme hybrid
    elseif den#tap('vim-colors-solarized')
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

    if has('nvim')
        set inccommand=nosplit
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
        let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro rnu'  " --> I want line numbers on the netrw buffer
        let g:netrw_browse_split = 4
        let g:netrw_banner = 0
        let g:netrw_winsize = 25
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
        nnoremap <silent> [spell]n :setlocal spell spelllang=en_en<cr>
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
            let g:deoplete#sources = {}
            let g:deoplete#sources._=['buffer', 'ultisnips', 'file', 'dictionary']
            let g:deoplete#sources.cs = ['cs', 'ultisnips', 'buffer']
            let g:deoplete#sources.python = ['jedi', 'ultisnips', 'buffer']
            let g:deoplete#omni#input_patterns = {}
            let g:deoplete#omni#input_patterns.cs = ['\w*']
            let g:deoplete#omni#input_patterns.rust = '[(\.)(::)]'
            let g:deoplete#keyword_patterns = {}
            let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.]*'

            let g:deoplete#sources#dictionary#dictionaries = {
                \ 'default' : '',
                \ 'vimshell' : $HOME.'/.vimshell_hist',
                \ 'scheme' : $HOME.'/.gosh_completions'
                    \ }
            " Use Tab
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

            aug omnicomplete
                au!
                au FileType css,sass,scss,stylus,less setl omnifunc=csscomplete#CompleteCSS
                au FileType html,htmldjango,jinja,markdown setl omnifunc=emmet#completeTag
                au FileType python setl omnifunc=pythoncomplete#Complete
                au FileType xml setl omnifunc=xmlcomplete#CompleteTags
            aug END


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
            " Trigger configuration.
            let g:UltiSnipsExpandTrigger='<c-e>'
            let g:UltiSnipsJumpForwardTrigger='<c-r>'
            let g:UltiSnipsJumpBackwardTrigger='<c-w>'

            " If you want :UltiSnipsEdit to split your window.
            let g:UltiSnipsEditSplit="vertical"
            let g:UltiSnipsSnippetsDir="~/.vim/snips/"
            let g:UltiSnipsSnippetDirectories = ["UltiSnips","snips"]

            " Use Python Version
            let g:UltiSnipsUsePythonVersion = 3
            let g:ultisnips_python_style="google"
        endif
    " }

    " Rust {
        if dein#tap("rust.vim")
            " let g:rustfmt_autosave = 1
            nmap <leader>f :Autoformat<cr>
            let g:formatdef_rustfmt='"rustfmt"'
            let g:formatters_rust=['rustfmt']
            let g:racer_cmd=expand("~/.cargo/bin/racer")
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

    " Lexical {
        if dein#tap("vim-lexical")
            " let g:lexical#spelllang = ['en_us', 'es_mx',]
        endif
    " }

    " Lexical {
        if dein#tap("vim-ditto")
            au FileType markdown,text,tex DittoOn  " Turn on Ditto's autocmds
        endif
    " }

    " Pencil {
        if dein#tap("vim-pencil")
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
        if dein#tap("goyo.vim")
            " let g:goyo_margin_top=0
            " let g:goyo_margin_bottom=0
            autocmd! User GoyoEnter Limelight
            autocmd! User GoyoLeave Limelight!
            nnoremap <leader>G :Goyo<CR>

            autocmd Filetype markdown call LaunchGoyo()
            autocmd Filetype text call LaunchGoyo()
            function LaunchGoyo()
              Goyo
            endfunction
        endif
    " }

    " OmniSharp {
        if dein#tap("omnisharp-vim")
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
        if dein#tap("vim-grepper")
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
        if dein#tap("denite.nvim")
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
