--local capabilities = require('cmp_nvim_lsp').default_capabilities()

local handlers = {

    -- Default Handler
    -- Will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name)
       require('lspconfig')[server_name].setup({})
    end,

    ["lua_ls"] = function()
        require('lspconfig').lua_ls.setup({
            settings = {
                Lua = {
                    completion = {
                        callSnippet = "Replace"
                    }
                }
            },
            capabilities = capabilities
        })
    end
}

return {
    {
        'williamboman/mason.nvim',
        opts = {},
    },
    {
        'williamboman/mason-lspconfig.nvim',
        opts = {
            handlers = handlers,
        },
    },
}
