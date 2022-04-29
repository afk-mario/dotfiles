" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:

" Notes {
" Personal vimrc of Mario Carballo Zama
" [afk] https://ellugar.co
" Temporary file for temporary solutions
" }

" Wayland clipboard provider that strips carriage returns (GTK3 issue).
" https://github.com/neovim/neovim/issues/10223
if exists('$WAYLAND_DISPLAY')
    " clipboard on wayland with newline fix
    let g:clipboard = {
        \   'name': 'WL-Clipboard with ^M Trim',
        \   'copy': {
        \      '+': 'wl-copy --foreground --type text/plain',
        \      '*': 'wl-copy --foreground --type text/plain --primary',
        \    },
        \   'paste': {
        \      '+': {-> systemlist('wl-paste --no-newline --type "text/plain;charset=utf-8" 2>/dev/null | sed -e "s/\r$//"', '', 1)},
        \      '*': {-> systemlist('wl-paste --no-newline --type "text/plain;charset=utf-8" --primary 2>/dev/null | sed -e "s/\r$//"', '', 1)},
        \   },
        \   'cache_enabled': 1,
        \ }
endif
