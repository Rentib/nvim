return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "VeryLazy" },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    config = function()
        require("nvim-treesitter.configs").setup({
            highlight = {
                enable = true,
                disable = { "latex" },
                additional_vim_regex_highlighting = false,
                use_languagetree = true,
            },
            indent = { enable = true },
            ensure_installed = {
                "c", "cpp",
                "bash",
                "html", "css", "javascript", "dart",
                "ocaml", "haskell",
                "python",
                "lua",
                "markdown", "markdown_inline",
                "regex", "vim", "vimdoc", "query",
            },
            ignore_install =  { "javascript" },
            incremental_selection = {
                enable = true,
                -- keymaps = {
                --     init_selection = "<C-space>",
                --     node_incremental = "<C-space>",
                --     scope_incremental = false,
                --     node_decremental = "<bs>",
                -- },
            },
            textobjects = { -- TODO: maybe remove?
                move = {
                    enable = true,
                    goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
                    goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
                    goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
                    goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
                },
            },
        })
    end,
}
