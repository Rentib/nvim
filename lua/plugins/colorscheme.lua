return {
    {
        "sainnhe/gruvbox-material",
        lazy = false,
        config = function()
            vim.cmd.colorscheme("gruvbox-material")
            -- vim.g.gruvbox_material_enable_bold = 1
            -- vim.g.gruvbox_material_enable_italic = 1
            vim.g.gruvbox_material_transparent_background = 2
            vim.g.gruvbox_material_dim_inactive_windows = 1
            vim.g.gruvbox_material_spell_foreground = 'colored'
        end
    },

    {
        "vague2k/huez.nvim",
        keys = { "<leader>cs" },
        config = function()
            require("huez").setup(
                {
                    file_path = vim.fs.normalize(vim.fn.stdpath("config")) .. "/.nvim.huez.lua",
                    fallback = "default",
                    omit = {
                        "default", "desert", "evening",
                        "industry", "koehler", "morning",
                        "murphy", "pablo", "peachpuff",
                        "ron", "shine", "slate",
                        "torte", "zellner", "blue",
                        "darkblue", "delek", "quiet",
                        "elflord", "habamax", "lunaperche",
                    },
                    picker = "telescope",
                    picker_opts = require("telescope.themes").get_dropdown({}),
                }
            )

            local colorscheme = require("huez.api").get_colorscheme()
            vim.cmd("colorscheme " .. colorscheme)

            vim.keymap.set("n", "<leader>cs", "<cmd>Huez<CR>", {})
        end
    },

    {
        'linrongbin16/colorbox.nvim',
        lazy = true,
        keys = { "<leader>cs" },
        dependencies = "rktjmp/lush.nvim",
        build = function() require('colorbox').update() end,
        config = function() require('colorbox').setup() end,
    },

}
