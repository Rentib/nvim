return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "VeryLazy" },
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
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
            textobjects = {
                enable = false,
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                        -- TODO: perhaps add more objects
                    },

                    selection_modes = {
                        -- 'v': charwise, 'V': linewise, '<c-v>': blockwise
                        ['@function.outer'] = 'V',
                    },
                    include_surrounding_whitespace = true,
                },

                swap = {
                    enable = true,
                    swap_next = {
                        ["<leader>a"] = "@parameter.inner", -- swap current parameter with the next one
                    },
                    swap_previous = {
                        ["<leader>A"] = "@parameter.inner", -- swap previous parameter with the next one
                    },
                },

                move = {
                    enable = false,
                },

                lsp_interop = {
                    enable = true,
                    border = 'none',
                    floating_preview_opts = {},
                    peek_definition_code = {
                        ["<leader>df" ] = "@function.outer",
                        ["<leader>dF" ] = "@class.outer",
                    },
                },
            },
        })
    end,
}
