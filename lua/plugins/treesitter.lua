return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                -- "c",
                -- "lua", "luadoc", "vim", "vimdoc", "query",
                --
                -- "comment", "printf", "regex",
                -- "bash", "python",
                -- "markdown", "markdown_inline",
                -- "make",
                -- "cpp",
                -- "dart",
                -- "html", "htmldjango", "css",
                -- "haskell", "haskell_persistent",
                --
                -- "git_config", "gitcommit", "passwd", "ssh_config",
                -- "zathurarc",
            },
            sync_install = false, -- synchronous install of parsers
            auto_install = false, -- install missing parsers when entering a buffer
            ignore_install = { "javascript" },

            highlight = {
                enable = true,
                disable = function(lang, buf)
                    if lang == "tex" then return true end
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = false }, -- makes indenting super slow
            textobjects = { enable = false },
        })

        -- NOTE: this fixes weird issues with comment parser
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function() vim.api.nvim_set_hl(0, "@lsp.type.comment", {}) end,
        })
    end,
}
