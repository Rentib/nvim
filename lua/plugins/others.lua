return {
    { 'lervag/vimtex', ft = 'tex' },
    -- https://github.com/barreiroleo/ltex_extra.nvim

    {
        "Rentib/cliff.nvim",
        keys = {
            { '<c-j>', mode = { 'n', 'v', 'o' }, function() require("cliff").go_down() end },
            { '<c-k>', mode = { 'n', 'v', 'o' }, function() require("cliff").go_up()   end },
        },
    },

    { 'github/copilot.vim', cmd = 'Copilot' },

    {
        'akinsho/flutter-tools.nvim',
        ft = 'dart',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {},
    },

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

    {
        'mrcjkb/rustaceanvim',
        version = '^5', -- Recommended
        lazy = false, -- This plugin is already lazy
    },

    -- TODO: see it these plugins are cool
    -- { 'Wansmer/treesj' },
    -- { 'mg979/vim-visual-multi' },
    -- { 'chentoast/marks.nvim' },
    -- { 'kylechui/nvim-surround', keys = { 'ys', 'ds', 'cs' } },
    -- {
    --     'nvimdev/dyninput.nvim',
    --     event = "VeryLazy",
    --     config = function()
    --         local rs = require('dyninput.lang.rust')
    --         local ms = require('dyninput.lang.misc')
    --         require('dyninput').setup({
    --             c = {
    --                 ['-'] = {
    --                     { '->', ms.c_struct_pointer },
    --                     { '_', ms.snake_case },
    --                 },
    --             },
    --             rust = {
    --                 [';'] = {
    --                     { '::', rs.double_colon },
    --                     { ': ', rs.single_colon },
    --                 },
    --                 ['='] = { ' => ', rs.fat_arrow },
    --                 ['-'] = {
    --                     { ' -> ', rs.thin_arrow },
    --                     { '_', ms.snake_case },
    --                 },
    --                 ['\\'] = { '|!| {}', rs.closure_fn },
    --             },
    --         })
    --     end,
    --     dependencies = {'nvim-treesitter/nvim-treesitter'}
    -- },
}
