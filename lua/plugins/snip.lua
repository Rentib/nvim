return {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    opts = {
        history = true,
        delete_check_events = "TextChanged",
    },
    keys = {
        { "<C-j>",
            function()
                return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<C-j>"
            end,
            expr = true, silent = true, mode = "i",
        },
        { "<C-j>", function() require("luasnip").jump( 1) end, mode = { "i", "s" } },
        { "<C-k>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
    }
}
