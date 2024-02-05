return {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    cmd = "Neogen",
    keys = "<leader>n",
    version = "*",
    config = function()
        local neogen = require("neogen")
        neogen.setup({
            snippet_engine = "luasnip",
        })
        vim.keymap.set("n", "<leader>n", neogen.generate, { noremap = true, silent = true })
    end
}
