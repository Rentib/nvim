return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "Fildo7525/pretty_hover",
        -- "smjonas/inc-rename.nvim",
    },
    event = { "BufRead", "BufNewFile" },
    config = function()
        local cmp_lsp = require("cmp_nvim_lsp")
        local mason = require("mason")
        local mason_lsp = require("mason-lspconfig")
        local ph_present, ph = pcall(require, "pretty_hover")
        local ir_present, ir = pcall(require, "inc_rename")

        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        if ph_present then ph.setup({}) end
        if ir_present then ir.setup({}) end

        mason.setup({})
        mason_lsp.setup({
            ensure_installed = {
                "clangd",
                "lua_ls",
            },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,

                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end,

                ["ltex"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.ltex.setup {
                        capabilities = capabilities,
                        root_dir = function(fname)
                            return lspconfig.util.find_git_ancestor(fname) or lspconfig.util.path.dirname(fname)
                        end,
                    }
                end,

                ["clangd"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.clangd.setup {
                        cmd = {
                            "clangd",
                            "--background-index",
                            "--suggest-missing-includes",
                            "--clang-tidy",
                            "--header-insertion=iwyu",
                            "--offset-encoding=utf-16",      -- copilot breaks it otherwise
                            "--query-driver=/usr/bin/*gcc*", -- different compilers
                        },
                        init_options = {
                            clangdFileStatus = true,
                        },
                    }
                end,
            }
        })
        vim.diagnostic.config({
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })

        local augroup = vim.api.nvim_create_augroup
        local rentib = augroup('rentib', {})

        vim.api.nvim_create_autocmd('LspAttach', {
            group = rentib,
            callback = function(e)
                local opts = { noremap = true, silent = true, buffer = e.buf }
                vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
                if ir_present then
                    vim.keymap.set("n", "<space>cn", function()
                        return ":IncRename " .. vim.fn.expand("<cword>")
                    end, { noremap = true, silent = true, buffer = e.buf, expr = true })
                else
                    vim.keymap.set("n", "<space>cn", vim.lsp.buf.rename, opts)
                end
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, opts)
                if ph_present then
                    vim.keymap.set("n", "K", ph.hover, opts)
                else
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                end
                vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

                vim.api.nvim_create_user_command("Format", function() vim.lsp.buf.format { async = true } end, {})
            end
        })
    end
}
