vim.o.hlsearch = false
vim.o.cursorline = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = ''
vim.o.termguicolors = true

-- spaces > tabs
vim.o.expandtab = true

-- Enable break indent
vim.o.tabstop=2
vim.o.shiftwidth=2
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

