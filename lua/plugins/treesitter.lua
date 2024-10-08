return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "VeryLazy" },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "c",
                "lua",
                "vim", "vimdoc", "query",

                "comment", "printf", "regex",
                "bash", "python",
                "markdown", "markdown_inline",
                "make",
                "cpp",
                "dart",
                "html", "htmldjango", "css",
                "haskell", "haskell_persistent",
                "git_config", "gitcommit", "passwd", "ssh_config",
            },
            sync_install = false, -- synchronous install of parsers
            auto_install = false, -- install missing parsers when entering a buffer
            ignore_install = { "javascript" },

            highlight = {
                enable = true,
                disable = function(lang, buf)
                    if lang == "tex" then return true end
                    local max_filesize = 1000 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,
                additional_vim_regex_highlighting = false,
            },
            -- indent = { enable = true },
            incremental_selection = {
                enable = false,
                keymaps = {
                    init_selection    = "<Leader>ss",
                    node_incremental  = "<Leader>si",
                    scope_incremental = "<Leader>sc",
                    node_decremental  = "<Leader>sd",
                },
            },
        })
    end,
}
