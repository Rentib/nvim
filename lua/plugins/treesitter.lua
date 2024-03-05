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
                "markdown", "markdown_inline",
                "lua", "regex", "vim", "vimdoc", "query",
            },
            ignore_install =  { "javascript" },
        })
    end,
}
