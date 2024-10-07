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

    { "chrisbra/csv.vim", ft = "csv" }

    -- TODO: see it these plugins are cool
    -- { 'Wansmer/treesj' },
    -- { 'mg979/vim-visual-multi' },
    -- { 'chentoast/marks.nvim' },
    -- { 'kylechui/nvim-surround', keys = { 'ys', 'ds', 'cs' } },
    -- {
    --     "NeogitOrg/neogit",
    --     cmd = "Neogit",
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --         "sindrets/diffview.nvim",
    --         "nvim-telescope/telescope.nvim",
    --     },
    --     config = true
    -- },
    -- {
    --     "uga-rosa/contextment.vim",
    --     dependencies = "Shougo/context_filetype.vim",
    --     keys = {
    --         { "gc",  "<Plug>(contextment)",      mode = { "n", "x", "o" } },
    --         { "gcc", "<Plug>(contextment-line)", mode = "n" },
    --     },
    -- },
    -- {
    --     'seandewar/killersheep.nvim',
    --     lazy = false,
    --     config = function ()
    --         require("killersheep").setup {
    --             gore = true,           -- Enables/disables blood and gore.
    --             keymaps = {
    --                 move_left = "h",     -- Keymap to move cannon to the left.
    --                 move_right = "l",    -- Keymap to move cannon to the right.
    --                 shoot = "<Space>",   -- Keymap to shoot the cannon.
    --             },
    --         }
    --     end
    -- },
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
    -- {
    --     "smjonas/live-command.nvim",
    --     event = "CmdlineEnter",
    --     opts = {
    --         commands = {
    --             Norm = { cmd = "norm" },
    --         },
    --     },
    -- },
}
