-- Initialize Lazy Package Manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    -- Managed Plugins
    require('plugins/catppuccin'),
    require('plugins/luasnip'),
    require('plugins/neodev'),
    require('plugins/lsp'),
    require('plugins/indent-blankline'),
    require('plugins/lualine'),
    require('plugins/autopairs'),
    require('plugins/treesitter'),
    require('plugins/telescope'),
    require('plugins/whichkey'),
    require('plugins/fidget'),
    require('plugins/harpoon'),
}, {})
