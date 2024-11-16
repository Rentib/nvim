return {
    {
        "sainnhe/gruvbox-material",
        priority = 1000,
        config = function()
            -- vim.g.gruvbox_material_enable_bold = 1
            -- vim.g.gruvbox_material_enable_italic = 1
            vim.g.gruvbox_material_transparent_background = 2
            vim.g.gruvbox_material_dim_inactive_windows = 1
            vim.g.gruvbox_material_spell_foreground = 'colored'
            vim.g.gruvbox_material_better_performance = 1
            vim.cmd.colorscheme("gruvbox-material")
        end
    },

    {
        "rose-pine/neovim",
        name = "rose-pine",
        priority = 1000,
        enabled = false,
        config = function()
            require("rose-pine").setup({
                variant = "auto",
                dark_variant = "moon",
                styles = {
                    bold = false,
                    italic = false,
                },
            })
            vim.cmd.colorscheme("rose-pine")
        end
    },

    {
        "rebelot/kanagawa.nvim",
        priority = 1000,
        enabled = false,
        config = function()
            require('kanagawa').setup({
                compile = true,  -- enable compiling the colorscheme
                undercurl = true, -- enable undercurls
                commentStyle = { italic = true },
                functionStyle = {},
                keywordStyle = { italic = true },
                statementStyle = { bold = true },
                typeStyle = {},
                transparent = false,   -- do not set background color
                dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
                terminalColors = true, -- define vim.g.terminal_color_{0,17}
                theme = "wave",        -- Load "wave" theme when 'background' option is not set
                background = {         -- map the value of 'background' option to a theme
                    dark = "wave",     -- try "dragon" !
                    light = "lotus"
                },
            })
            vim.cmd.colorscheme("kanagawa")
        end
    },

    -- for more colorschemes use vague2k/huez.nvim with linrongbin16/colorbox.nvim
}
