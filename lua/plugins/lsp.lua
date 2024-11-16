local servers = {
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
                workspace = {
                    library = vim.api.nvim_get_runtime_file('', true),
                    checkThirdParty = false,
                },
                runtime = { version = "LuaJIT" },
            }
        }
    },

    texlab = true,
    ltex = {
        filetypes = { "text", "plaintext", "tex", "markdown" },
        flags = { debounce_text_changes = 300 },
    },

    asm_lsp = {
        filetypes = { "asm", "nasm", "masm" },
    },

    basedpyright = {
        settings = {
            basedpyright = {
                analysis = {
                    ignore = { "*" },         -- ruff
                    typeCheckingMode = "off", -- ruff
                },
            },
        },
    },
}

local linters = {
    python = { "ruff" },
}

return {
    { "williamboman/mason.nvim", cmd = { "Mason" }, opts = {} },
    {
        "neovim/nvim-lspconfig",
        event = { "BufRead", "BufNewFile" },
        config = function()
            -- add binaries installed by mason.nvim to path
            local is_windows = vim.fn.has "win32" ~= 0
            local sep = is_windows and "\\" or "/"
            local delim = is_windows and ";" or ":"
            vim.env.PATH = table.concat({ vim.fn.stdpath "data", "mason", "bin" }, sep) .. delim .. vim.env.PATH

            local capabilities = nil
            if pcall(require, "cmp_nvim_lsp") then
                capabilities = require('cmp_nvim_lsp').default_capabilities { snippet_support = false }
            end

            local lspconfig = require("lspconfig")

            local function setup_server(server, config)
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
    {
        "mfussenegger/nvim-lint",
        event = { "BufRead", "BufNewFile" },
        config = function()
            local lint = require("lint")

            lint.linters_by_ft = linters

            local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
            vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
                group = lint_augroup,
                callback = function() lint.try_lint() end,
            })
        end,
    },
}
