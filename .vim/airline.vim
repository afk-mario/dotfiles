let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
set encoding=utf-8 " Necessary to show Unicode glyphs
let g:Powerline_symbols = 'fancy'"
let g:airline_powerline_fonts = 1
set laststatus=2
set noshowmode
set t_Co=256

let g:airline_detect_paste=1
let g:airline_theme='gruvbox'

let g:airline_section_z = airline#section#create(['%{ObsessionStatus(''$'', '''')}', 'windowswap', '%3p%% ', 'linenr', ':%3v '])
