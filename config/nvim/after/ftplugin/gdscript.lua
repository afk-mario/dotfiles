local pipepath = vim.fn.stdpath('cache') .. '/server.pipe'
if not vim.loop.fs_stat(pipepath) then
	vim.fn.serverstart(pipepath)
end
-- setlocal tabstop=4
-- vim.keymap.set('n', '<leader>r', vim.cmd.GodotRun, { buffer = true })
-- vim.keymap
-- 	.set('n', '<leader>gr', vim.cmd.GodotRunFZF, { buffer = true })
-- nnoremap <buffer> <F4> :GodotRunLast<CR>
-- nnoremap <buffer> <F5> :GodotRun<CR>
-- nnoremap <buffer> <F6> :GodotRunCurrent<CR>
-- nnoremap <buffer> <F7> :GodotRunFZF<CR>
