return {
    { 'lervag/vimtex', ft = 'tex' },
    -- https://github.com/barreiroleo/ltex_extra.nvim

    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = "markdown",
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    {
        "Rentib/cliff.nvim",
        keys = {
            { '<c-j>', mode = { 'n', 'v', 'o' }, function() require("cliff").go_down() end },
            { '<c-k>', mode = { 'n', 'v', 'o' }, function() require("cliff").go_up()   end },
        },
    },

    { 'github/copilot.vim', cmd = 'Copilot' },

    { "farmergreg/vim-lastplace", event = "VeryLazy" },

    {
        'folke/trouble.nvim',
        keys = { { '<leader>t', mode = { 'n' }, "<cmd>TroubleToggle<cr>", { noremap = true, silent = true }} },
        cmd = { 'Trouble', 'TroubleToggle' },
    },

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
}
