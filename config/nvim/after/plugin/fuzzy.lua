vim.keymap.set('n', '<leader>pf', vim.cmd.Files)
vim.keymap.set('n', '<leader>pb', vim.cmd.Buffers)
vim.keymap.set('n', '<leader>pg', vim.cmd.Rg)
vim.keymap.set('n', '<leader>pl', vim.cmd.Lines)
vim.keymap.set('n', '<leader>pc', vim.cmd.Colors)
vim.keymap.set('n', '<leader>pr', vim.cmd.History)

vim.cmd [[let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob=!.git/']]
vim.g.fzf_history_dir = '~/.local/share/fzf-history'
