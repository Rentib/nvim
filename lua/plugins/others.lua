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
