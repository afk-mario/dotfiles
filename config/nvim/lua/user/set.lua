-- Allow for cursor beyond last character
vim.opt.virtualedit = "onemore"
vim.opt.scrolloff = 8
vim.opt.updatetime = 50

-- Backups
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.inccommand = "nosplit"

-- Formatting
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.smartindent = true
-- Puts new vsplit windows to the right of the current
vim.opt.splitright = true
-- Puts new split windows to the bottom of the current
vim.opt.splitbelow = true

-- NETWR
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.cmd([[
autocmd FileType netrw setl bufhidden=delete
]])


-- UI
vim.opt.guicursor = ""
vim.opt.termguicolors = true
vim.opt.showtabline = 1

-- Only show 15 tabs
vim.opt.tabpagemax = 15
-- Highlight current line
vim.opt.cursorline = true
-- No extra spaces between rows
vim.opt.linespace = 0
vim.opt.nu = true
vim.opt.relativenumber = true

-- Show matching brackets/parenthesis
vim.opt.showmatch = true
-- Windows can be 0 line high
vim.opt.winminheight = 0
-- Case insensitive search
vim.opt.ignorecase = true
-- Case sensitive when uc present
vim.opt.smartcase = true
-- Command <Tab> completion, list matches, then longest common part, then all.
vim.opt.wildmode = { "longest:full", "full" }
-- Backspace and cursor keys wrap too
-- vim.opt.whichwrap = { "b","s","h","l","<",">","[","]" }
-- Lines to scroll when cursor leaves screen
vim.opt.scrolljump = 5
vim.opt.list = true
-- Avoid LSP signs to flicker size of buffer
vim.opt.signcolumn = "yes"
