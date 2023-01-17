-- let g:BufKillCreateMappings = 0
-- nnoremap <silent> [buffer], :BD<cr>
vim.g.BufKillCreateMappings = 0
vim.keymap.set("n", "<leader>b,", vim.cmd.BD)
