return {
    {
        "Rentib/cliff.nvim",
        keys = {
            { "<c-j>", mode = { "n", "v", "o" }, function() require("cliff").go_down() end },
            { "<c-k>", mode = { "n", "v", "o" }, function() require("cliff").go_up() end },
        },
    },
    { "farmergreg/vim-lastplace" },

    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        config = function()
            require("copilot").setup({
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    debounce = 50,
                    keymap = { accept = "<c-l>" },
                },
            })
        end,
    },

    { "stevearc/oil.nvim",       opts = {} },

    -- tpope
    { "tpope/vim-fugitive",      cmd = { "G" } },
    { "tpope/vim-surround",      keys = { "ys", "ds", "cs" } },
    { "tpope/vim-rsi",           event = { "InsertEnter", "CmdLineEnter" } },
    -- https://github.com/tpope/vim-commentary
    -- https://github.com/tpope/vim-rhubarb
    -- https://github.com/tpope/vim-abolish

    -- language specific
    -- { "lervag/vimtex",              ft = "tex" },
    -- { "akinsho/flutter-tools.nvim", ft = "dart",                              dependencies = { "nvim-lua/plenary.nvim" },             opts = {} },
    -- { "mrcjkb/rustaceanvim",        version = "^6" },
    -- { 'mrcjkb/haskell-tools.nvim',  version = "^6",                           ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' } },
}
