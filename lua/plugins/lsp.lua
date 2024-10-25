local servers = {
    bashls = true,
    clangd = {
        cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--function-arg-placeholders=0",
            "--header-insertion=iwyu",
            "--header-insertion-decorators",
            "--offset-encoding=utf-16", -- copilot breaks it otherwise
            -- "--query-driver=/usr/bin/*gcc*", -- different compilers
        },
        init_options = {
            clangdFileStatus = true,
        },
    },
    lua_ls = {
        settings = {
            Lua = {
                diagnostics = { globals = { "vim" }, },
                workspace = {
                    library = {
                        [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                        [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
                        [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
                    },
                    maxPreload = 100000,
                    preloadFileSize = 10000,
                },
            },
        }
    },
    basedpyright = true,
    texlab = true,
}

return {
    {
        "williamboman/mason.nvim",
        cmd = { "Mason" },
        opts = {},
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufRead", "BufNewFile" },
        config = function()
            local lspconfig = require("lspconfig")

            -- add binaries created by Mason without loading Mason
            local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
            vim.env.PATH = vim.fn.stdpath "data" .. "/mason/bin" .. (is_windows and ";" or ":") .. vim.env.PATH

            local capabilities = vim.lsp.protocol.make_client_capabilities()

            local setup_server = function(server, config)
                if not config then return end
                if type(config) ~= "table" then config = {} end

                config = vim.tbl_deep_extend("force", {
                    on_init = function(client)
                        client.config.flags = client.config.flags or {}
                        client.config.flags.allow_incremental_sync = true
                    end,
                    capabilities = capabilities,
                }, config)

                lspconfig[server].setup(config)
            end

            for server, config in pairs(servers) do
                setup_server(server, config)
            end
        end
    },
}
