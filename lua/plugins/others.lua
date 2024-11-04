return {
    {
        "Rentib/cliff.nvim",
        keys = {
            { '<c-j>', mode = { 'n', 'v', 'o' }, function() require("cliff").go_down() end },
            { '<c-k>', mode = { 'n', 'v', 'o' }, function() require("cliff").go_up()   end },
        },
    },

    { 'github/copilot.vim', cmd = 'Copilot' },

    {
        'brenoprata10/nvim-highlight-colors',
        cmd = { 'HighlightColors' },
        ft = { 'css' },
        opts = {
            render = 'background',
            enable_named_colors = true,
            enable_tailwind = false,
        },
    },

    { "chrisbra/csv.vim", ft = "csv" },

    { 'lervag/vimtex', ft = 'tex' },

    {
        'akinsho/flutter-tools.nvim',
        ft = 'dart',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {},
    },

    {
        'mrcjkb/rustaceanvim',
        version = '^5', -- Recommended
        lazy = false, -- This plugin is already lazy
    },

    -- TODO: see it these plugins are cool
    -- { 'Wansmer/treesj' },
}
