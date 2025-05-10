return {
    {
        "sainnhe/gruvbox-material",
        priority = 1000,
        config = function()
            vim.g.gruvbox_material_transparent_background = 2
            vim.g.gruvbox_material_dim_inactive_windows = 1
            vim.g.gruvbox_material_spell_foreground = "colored"
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
            vim.cmd("colorscheme rose-pine")
        end
    },
}
