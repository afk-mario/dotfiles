" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:

" Notes {
    " Personal vimrc of Mario Carballo Zama
    " [afk] https://ellugar.co
    " This should handle all helper functions
" }

" Initialize directories {
    function! InitializeDirectories()
        let l:parent = $HOME
        let l:prefix = 'vim'
        let l:dir_list = {
                    \ 'backup': 'backupdir',
                    \ 'views': 'viewdir',
                    \ 'swap': 'directory' }

        if has('persistent_undo')
            let l:dir_list['undo'] = 'undodir'
        endif

        let l:common_dir = l:parent . '/.' . l:prefix

        for [l:dirname, l:settingname] in items(l:dir_list)
            let l:directory = l:common_dir . l:dirname . '/'
            if exists('*mkdir')
                if !isdirectory(l:directory)
                    call mkdir(l:directory)
                endif
            endif
            if !isdirectory(l:directory)
                echo 'Warning: Unable to create backup directory: ' . l:directory
                echo 'Try: mkdir -p ' . l:directory
            else
                let l:directory = substitute(l:directory, ' ', "\\\\ ", 'g')
                exec 'set ' . l:settingname . '=' . l:directory
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
    augroup end
" }
