vim.g.mapleader = ' '

-- Better Default Experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<C-d>', '<C-d>zz')
vim.keymap.set({ 'n', 'v' }, '<C-u>', '<C-u>zz')

-- Tabs
vim.keymap.set('n', '<A-1>', '1gt', { desc = 'Go to Tab 1'})
vim.keymap.set('n', '<A-2>', '2gt', { desc = 'Go to Tab 2'})
vim.keymap.set('n', '<A-3>', '3gt', { desc = 'Go to Tab 3'})
vim.keymap.set('n', '<A-4>', '4gt', { desc = 'Go to Tab 4'})
vim.keymap.set('n', '<A-5>', '5gt', { desc = 'Go to Tab 5'})
vim.keymap.set('n', '<A-6>', '6gt', { desc = 'Go to Tab 6'})
vim.keymap.set('n', '<A-7>', '7gt', { desc = 'Go to Tab 7'})
vim.keymap.set('n', '<A-8>', '8gt', { desc = 'Go to Tab 8'})
vim.keymap.set('n', '<A-9>', '9gt', { desc = 'Go to Tab 9'})

-- Fast Split
vim.keymap.set('n', '<Leader>x', '<Cmd>split<CR>', { desc = 'Horizontal Split'})
vim.keymap.set('n', '<Leader>v', '<Cmd>vert split<CR>', { desc = 'Veritcal Split'})

-- Remap for dealing with word wrap
-- vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Unified Panel Navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Select left' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Select down' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Select up' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Select right' })

-- Panel Management
vim.keymap.set('n', '<leader>j', '<Cmd>NvimTreeClose<CR><Cmd>WinShift<CR>', { desc = 'Window Management Mode' })
vim.keymap.set('n', '<leader>k', '<Cmd>NvimTreeClose<CR><Cmd>WinShift swap<CR>', { desc = 'Swap Windows' })

-- Panel Resizing
vim.keymap.set('n', '+', '<C-w>+', { desc = 'Increase Panel Vertical' })
vim.keymap.set('n', '_', '<C-w>-', { desc = 'Decrease Panel Vertical' })
vim.keymap.set('n', '-', '<C-w><', { desc = 'Increase Panel Horizontal' })
vim.keymap.set('n', '=', '<C-w>>', { desc = 'Decrease Panel Horizontal' })

-- Quick Line Move
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { desc = 'Move current line down' })
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { desc = 'Move current line up' })

vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv-gv", { desc = 'Move current lines down' })
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv-gv", { desc = 'Move current lines up' })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()` local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})



-- Telescope

-- Enable fzf native
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>b', require('telescope.builtin').buffers, { desc = 'Find existing [B]uffers' })
vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
-- vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sk', require('telescope.builtin').keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').registers, { desc = '[S]earch [R]egisters' })
vim.keymap.set('n', '<leader>ss', "<cmd>:Telescope aerial<CR>", { silent = true, desc = '[S]earch [S]ymbols' })


-- Diagnostic Keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })


-- Nvimtree

vim.keymap.set('n', '<TAB>', "<cmd> NvimTreeToggle<CR>", { desc = 'Toggle NvimTree' })

-- Format Code
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { desc = 'Autoformat' })

-- ToggleTerm
-- Default Open is located in toggleterm config
local function term_tree_placement()
  local api = require("nvim-tree.api")
  if api.tree.is_visible then
    api.tree.toggle()
    vim.cmd('ToggleTerm direction=horizontal')
    local term = vim.api.nvim_get_current_win()
    api.tree.toggle()
    vim.api.nvim_set_current_win(term)
  else
      vim.cmd('ToggleTerm direction=horizontal')
  end
end

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

vim.keymap.set('n', "<C-Bslash>", term_tree_placement, { silent = true, desc = 'Open Horizontal Terminal' })
vim.keymap.set('t', "<C-Bslash>", "<Cmd>exe v:count1 . 'ToggleTerm direction=float'<CR>", { silent = true, desc = 'Close Horizontal Terminal' })
vim.keymap.set('n', '<F1>', "<Cmd>exe v:count1 . 'ToggleTerm direction=float'<CR>", { silent = true, desc = 'Open Floating Terminal' })
vim.keymap.set('t', '<F1>', "<Esc><Cmd>exe v:count1 . 'ToggleTerm direction=float'<CR>", { silent = true, desc = 'Close Floating Terminal' })
vim.keymap.set('n', '<F2>', "<Cmd>exe v:count1 . 'ToggleTerm direction=vertical size=40'<CR>", { silent = true, desc = 'Open Vertical Terminal' })
vim.keymap.set('t', '<F2>', "<Esc><Cmd>exe v:count1 . 'ToggleTerm direction=vertical size=40'<CR>", { silent = true, desc = 'Close Vertical Terminal' })

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- Bufferline
vim.keymap.set('n', "<C-S-q>", "<Cmd>BufferLinePickClose<CR>", {desc = 'Buffer Pick Close' })
vim.keymap.set('n', "<C-S-j>", "<Cmd>BufferLineCycleNext<CR>", { silent = true, desc = 'Focus Right Buffer' })
vim.keymap.set('n', "<C-S-k>", "<Cmd>BufferLineCyclePrev<CR>", { silent = true, desc = 'Focus Left Buffer' })
vim.keymap.set('n', "<C-S-h>", "<Cmd>BufferLineMovePrev<CR>", { silent = true, desc = 'Move Buffer Left' })
vim.keymap.set('n', "<C-S-l>", "<Cmd>BufferLineMoveNext<CR>", { silent = true, desc = 'Move Buffer RIght' })

-- align.nvim
vim.keymap.set('x', '<Leader>al', function() require'align'.align_to_string(false, true, true) end, {noremap = true, silent = true, desc = "[AL]igns to a string, looking left and with previews"})

-- diagnostics toggle
local diagnostics_active = true
vim.keymap.set('n', '<leader>dd', function()
  diagnostics_active = not diagnostics_active
  if diagnostics_active then
    vim.diagnostic.show()
  else
    vim.diagnostic.hide()
  end
end, {desc = 'LSP: [d]isplay [d]iagnostics'})
