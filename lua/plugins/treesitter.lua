return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "VeryLazy" },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
            sync_install = false, -- synchronous install of parsers
            auto_install = true,  -- install missing parsers when entering a buffer
            ignore_install = { "java_script" },

            highlight = {
                enable = true,
                disable = { "latex" }, -- vimtex is better at this
                additional_vim_regex_highlighting = false,
            },

            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection    = "<Leader>ss",
                    node_incremental  = "<Leader>si",
                    scope_incremental = "<Leader>sc",
                    node_decremental  = "<Leader>sd",
                },
            },

            indent = { enable = true },
            textobjects = { enable = true },
        })
    end,
}
