vim.lsp.config("*", {
    capabilities = vim.tbl_deep_extend(
        "force",
        require("blink.cmp").get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities()),
        {
            textDocument = {
                completion = {
                    completionItem = {
                        snippetSupport = false,
                    },
                },
            },
        }
    ),
    root_markers = { ".git" },
})

vim.lsp.config("clangd", {
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--function-arg-placeholders=0",
        "--header-insertion=never",
        "--header-insertion-decorators",
        "--offset-encoding=utf-16", -- copilot breaks it otherwise
        -- "--query-driver=/usr/bin/*gcc*", -- different compilers
        "--suggest-missing-includes",
    },
    filetypes = { "c", "cpp", "cuda" },
    root_markers = { ".git" },
    init_options = { clangdFileStatus = true },
})

vim.lsp.config("LuaLS", {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { ".git", ".luarc.json", ".luarc.jsonc" },
    -- https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
    settings = {
        Lua = {
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            runtime = { version = "LuaJIT" },
            completion = {
                callSnippet = "Disable",
                keywordSnippet = "Disable",
            },
        }
    }
})

vim.lsp.config("texlab", {
    cmd = { "texlab" },
    filetypes = { "tex", "plaintex", "bib" },
    root_markers = { ".git" },
    settings = {
        texlab = {
            chktex = {
                onOpenAndSave = false,
                onEdit = false,
            },
            diagnosticsDelay = 300,
            latexFormatter = 'latexindent',
            latexindent = {
                ['local'] = nil, -- local is a reserved keyword
                modifyLineBreaks = false,
            },
            bibtexFormatter = 'texlab',
            formatterLineLength = 80,
        }
    }
})

vim.lsp.config("ltex-plus", {
    cmd = { "ltex-ls-plus" },
    filetypes = { "bib", "markdown", "plaintex", "tex" },
    root_markers = { ".git" },
    settings = {
        ltex = {
            enabled = { "bib", "markdown", "plaintex", "tex" },
            language = "en-GB",
            additionalRules = {
                enablePickyRules = true,
                motherTongue = "pl-PL",
            },
            -- completionEnabled = true,
            checkFrequency = "save",
        },
    },
})

vim.lsp.config("basedpyright", {
    cmd = { "basedpyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", "pyrightconfig.json", ".git" },
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
})

vim.lsp.config("ruff", {
    cmd = { "ruff", "server" },
    filetypes = { "python" },
    root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", "ruff.toml", ".ruff.toml", ".git" },
    -- https://docs.astral.sh/ruff/
    settings = {
        indent_width = 4,
        line_length = 80,
    },
})

vim.lsp.config("bash-language-server", {
    cmd = { "bash-language-server", "start" },
    filetypes = { "sh", "bash", "zsh" },
})

vim.lsp.config("harper", {
    cmd = { "harper", "--stdio" },
    filetypes = { "gitcommit", "typst" },
    root_markers = { ".git" },
    settings = {
        ["harper"] = {
            userDictPath = "",
            fileDictPath = "",
            linters = {
                AnA = true,
                BoringWords = true,
                CorrectNumberSuffix = true,
                LinkingVerbs = false,
                LongSentences = true,
                Matcher = true,
                NoOxfordComma = false,
                RepeatedWords = true,
                SentenceCapitalization = true,
                Spaces = true,
                SpellCheck = true,
                SpelledNumbers = true,
                UnclosedQuotes = true,
                UseGenitive = true,
                WrongQuotes = false,
            },
            codeActions = {
                ForceStable = false,
            },
            markdown = {
                IgnoreLinkTitle = false,
            },
            diagnosticSeverity = "hint",
            isolateEnglish = true,
            dialect = "British", -- American/British
        }
    },
})

vim.lsp.config("tinymist", {
    cmd = { "tinymist" },
    filetypes = { "typst" },
    root_markers = { ".git" },
    settings = {
        projectResolution = "lockDatabase",
        exportPdf = "onSave", -- never/onSave/onType
        formatterPrintWidth = 80,
        formatterIndentSize = 4,
        completion = { triggerOnSnippetPlaceholders = true, },
    },
})

vim.lsp.enable({
    "clangd",
    "LuaLS",
    "texlab",
    "ltex-plus",
    "basedpyright",
    "ruff",
    "bash-language-server",
    "harper",
    "tinymist",
})

vim.diagnostic.config({
    underline = true,
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    severity_sort = true,
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client:supports_method('textDocument/documentColor') then
            vim.lsp.document_color.enable(true, args.buf, { style = 'virtual' })
        end
    end
})

vim.cmd("command! LspStop lua vim.lsp.stop_client(vim.lsp.get_clients())")
