return {
    "hrsh7th/nvim-cmp",
    opts = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
}
