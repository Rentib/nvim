return {
    {
        "sainnhe/gruvbox-material",
        priority = 1000,
        config = function()
            -- vim.g.gruvbox_material_enable_bold = 1
            -- vim.g.gruvbox_material_enable_italic = 1
            vim.g.gruvbox_material_transparent_background = 2
            vim.g.gruvbox_material_dim_inactive_windows = 1
            vim.g.gruvbox_material_spell_foreground = "colored"
            vim.g.gruvbox_material_better_performance = 1
            vim.cmd.colorscheme("gruvbox-material")
        end
    },

    -- for more colorschemes use vague2k/huez.nvim with linrongbin16/colorbox.nvim
}
