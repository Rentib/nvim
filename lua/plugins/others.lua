return {
    { 'lervag/vimtex', ft = 'tex' },
    -- https://github.com/barreiroleo/ltex_extra.nvim

    {
        'github/copilot.vim',
        cmd = 'Copilot',
        config = function() vim.g.copilot_enabled = 0 end
    },

    {
        'folke/trouble.nvim',
        keys = { '<leader>t' },
        cmd = { 'Trouble', 'TroubleToggle' },
        config = function()
            vim.api.nvim_set_keymap("n", "<leader>t", "<Cmd>TroubleToggle<CR>", { noremap = true, silent = true })
            require("trouble").setup({})
        end
    },

    {
        'akinsho/flutter-tools.nvim',
        ft = 'dart',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function() require('flutter-tools').setup({}) end
    },

    {
        'uga-rosa/ccc.nvim',
        cmd = { 'CccPick', 'CccHighlighterEnable', 'CccHighlighterToggle' },
        config = function() require("ccc").setup({}) end
    },

    {
        'simonmclean/triptych.nvim',
        event = 'VeryLazy',
        cmd = "Triptych",
        keys = "<leader>-",
        dependencies = {
            'nvim-lua/plenary.nvim', -- required
            'nvim-tree/nvim-web-devicons', -- optional
        },
        config = function ()
            require 'triptych'.setup()
            vim.keymap.set('n', '<leader>-', ':Triptych<CR>', { silent = true })
        end
    },
}
