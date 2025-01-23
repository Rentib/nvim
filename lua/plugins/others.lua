return {
    {
        "Rentib/cliff.nvim",
        keys = {
            { "<c-j>", mode = { "n", "v", "o" }, function() require("cliff").go_down() end },
            { "<c-k>", mode = { "n", "v", "o" }, function() require("cliff").go_up() end },
        },
    },

    { "github/copilot.vim", cmd = "Copilot" },

    { "lervag/vimtex",      ft = "tex" },

    {
        "akinsho/flutter-tools.nvim",
        ft = "dart",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
    },

    {
        "mrcjkb/rustaceanvim",
        version = "^5",
        lazy = false,
    },
}
