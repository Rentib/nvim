return {
    { 'lervag/vimtex', ft = 'tex' },
    -- https://github.com/barreiroleo/ltex_extra.nvim

    {
        "glacambre/firenvim",
        lazy = not vim.g.started_by_firenvim,
        build = function() vim.fn["firenvim#install"](0) end
    },

    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = "markdown",
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    {
        "Rentib/cliff.nvim",
        event = "VeryLazy",
        config = function()
            local cliff = require('cliff')
            local m = require('keymap')

            m.n('<c-j>', cliff.go_down, { expr = true })
            m.o('<c-j>', cliff.go_down, { expr = true })
            m.v('<c-j>', cliff.go_down, { expr = true })
            m.n('<c-k>', cliff.go_up,   { expr = true })
            m.o('<c-k>', cliff.go_up,   { expr = true })
            m.v('<c-k>', cliff.go_up,   { expr = true })
        end
    },

    { 'github/copilot.vim', cmd = 'Copilot' },

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
