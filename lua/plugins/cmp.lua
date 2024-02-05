return {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    dependencies = {
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-nvim-lsp-signature-help" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "saadparwaiz1/cmp_luasnip" },
        -- { "micangl/cmp-vimtex", ft = "tex" },
    },
    config = function()
        local cmp = require("cmp")
        cmp.setup({
            completion = {
                completeopt = "menu,menuone,noinsert",
            },
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<C-y>"] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true,
                },
                ["<C-space>"] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true,
                },
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "nvim_lsp_signature_help" },
                { name = "luasnip" },
            }, {
                { name = "buffer" },
                { name = "path" },
            }),
            experimental = {
                ghost_text = true,
            },
        })
    end
}
