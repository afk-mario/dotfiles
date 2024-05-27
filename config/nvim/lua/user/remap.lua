vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Move lines visually selected
-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor when joining lines
vim.keymap.set('n', 'J', 'mzJ`z')
-- Keep the cursor in the middle of the screen when scrolling
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
-- Keep the cursor in the middle of the screen when jumping to search
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Paste under the cursor and move the new word to the void register
vim.keymap.set('x', '<leader>p', '\"_dP')

-- Yank to system register
vim.keymap.set('n', '<leader>y', '\"+y')
vim.keymap.set('v', '<leader>y', '\"+y')
vim.keymap.set('n', '<leader>Y', '\"+Y')

-- Delete without altering the register
vim.keymap.set('n', '<leader>d', '\"_d')
vim.keymap.set('v', '<leader>d', '\"_d')

-- Wrapped lines goes down/up to next row, rather than next line in file.
vim.keymap.set('', 'j', 'gj')
vim.keymap.set('', 'k', 'gk')

vim.keymap.set('n', '<leader>bt', vim.cmd.enew)
vim.keymap.set('n', '<leader>bl', vim.cmd.bnext)
vim.keymap.set('n', '<leader>bh', vim.cmd.bprevious)
vim.keymap.set('n', '<leader>bq', ':bp <BAR> bd #<CR>')
vim.keymap.set('n', '<leader>bw', vim.cmd.bw)
vim.keymap.set('n', '<leader>bs', vim.cmd.ls)
vim.keymap.set('n', '<leader>b1', vim.cmd.bfirst)
vim.keymap.set('n', '<leader>b0', vim.cmd.blast)

-- Visual shifting (does not exit Visual mode)
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Allow using the repeat operator with a visual selection (!)
-- http://stackoverflow.com/a/8064607/127816
vim.keymap.set('v', '.', ':normal .<CR>')

-- Zoom in into a pane
-- vim.keymap.set("", "Zz", "<c-w>_ \| <c-w>\|")
-- Zoom out
-- vim.keymap.set("", "Zo", "<c-w>=")

-- Disable keys
vim.keymap.set('n', 'Q', '<nop>')
vim.keymap.set('n', '<Up>', '<nop>')
vim.keymap.set('n', '<Down>', '<nop>')
vim.keymap.set('n', '<Left>', '<nop>')
vim.keymap.set('n', '<Right>', '<nop>')

vim.keymap.set('n', '<F5>', ':Dispatch!<CR>')
