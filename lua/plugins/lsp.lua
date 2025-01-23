-- NOTE: https://www.andersevenrud.net/neovim.github.io/lsp/
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
            "--suggest-missing-includes",
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

    texlab = {
        settings = {
            texlab = {
                -- NOTE: preview without vimtex
                -- build = {
                --     executable = "latexmk",
                --     forwardSearchAfter = true,
                --     onSave = true,
                -- },
                -- forwardSearch = {
                --     executable = "zathura",
                --     args = { "--synctex-forward", "%l:%1:%f", "%p" },
                -- },
            },
        },
    },
    ltex = {
        filetypes = { "text", "plaintext", "tex", "markdown" },
        flags = { debounce_text_changes = 300 },
        settings = {
            ltex = {
                language = "en-GB",
                additionalRules = {
                    enablePickyRules = true,
                    motherTongue = "pl-PL",
                },
                -- completionEnabled = true,
                checkFrequency = "save",
            },
        },
    },

    asm_lsp = {
        filetypes = { "asm", "nasm", "masm" },
    },

    basedpyright = {
        settings = {
            basedpyright = {
                disableOrganizeImports = true,
                analysis = {
                    ignore = { "*" },
                    typeCheckingMode = "off",
                    diagnosticMode = "openFilesOnly",
                    inlayHints = {
                        callArgumentNames = true
                    }
                },
            },
        },
    },

    ruff = {
        flags = { debounce_text_changes = 300 },
        init_options = {
            settings = {
            },
        },
    },

    bashls = { -- uses shellcheck for linting by default
        filetypes = { "sh", "bash" },
        flags = { debounce_text_changes = 300 },
    },
}

vim.diagnostic.config({
    underline = true,
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    severity_sort = true,
})

return {
    { "williamboman/mason.nvim", cmd = { "Mason" }, opts = {} },
    {
        "neovim/nvim-lspconfig",
        event = "User FilePost",
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

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("disable_ruff_hover", { clear = true }),
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if client ~= nil and client.name == 'ruff' then
                        client.server_capabilities.hoverProvider = false
                    end
                end,
            })
        end
    },
    {
        "stevearc/conform.nvim",
        config = function()
            local conform = require("conform")

            conform.setup({
                formatters_by_ft = {
                    asm = { "asmfmt" },
                    c = { "clang-format" },
                    cpp = { "clang-format" },
                    json = { "jq" },
                    python = { "ruff_format" },
                    shell = { "shfmt" },
                },
            })

            vim.api.nvim_create_user_command("Format", function(args)
                local range = nil
                if args.count ~= -1 then
                    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
                    range = {
                        start = { args.line1, 0 },
                        ["end"] = { args.line2, end_line:len() },
                    }
                end
                conform.format({ async = true, lsp_format = "fallback", range = range })
            end, { range = true })
        end
    },
}
