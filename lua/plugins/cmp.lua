return {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter" },
    dependencies = {
        -- { "hrsh7th/cmp-nvim-lsp" },
        { "iguanacucumber/mag-nvim-lsp",                   name = "cmp-nvim-lsp", opts = {} },
        { "hrsh7th/cmp-nvim-lsp-signature-help" },
        -- { "hrsh7th/cmp-buffer" },
        { "iguanacucumber/mag-buffer",                     name = "cmp-buffer" },
        { "https://codeberg.org/FelipeLema/cmp-async-path" },
    },
    config = function()
        local cmp = require("cmp")
        local mapping = {
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
        }
        cmp.setup({
            performance = { debounce = 0, throttle = 0 },
            snippet = { expand = function(args) vim.snippet.expand(args.body) end },
            mapping = cmp.mapping.preset.insert(mapping),
            sources = cmp.config.sources({
                {
                    name = "nvim_lsp",
                    max_item_count = 7,
                    entry_filter = function(entry) return entry:get_kind() ~= cmp.lsp.CompletionItemKind.Snippet end,
                },
                { name = "nvim_lsp_signature_help" },
                {
                    name = "buffer",
                    max_item_count = 5,
                    option = { keyword_pattern = [[\k\+]] },
                },
                { name = "async_path" }, -- "path"
            }),
            experimental = { ghost_text = true },
            formatting = {},
        })
    end
}
