return {
    cmd = { "tinymist" },
    filetypes = { "typst" },
    root_markers = { ".git" },
    settings = {
        projectResolution = "lockDatabase",
        -- outputPath = "",
        exportTarget = "paged", -- paged/html
        exportPdf = "onSave",   -- never/onSave/onType
        -- rootPath = "",
        semanticTokens = "enable",
        -- systemFonts = true,
        -- fontPaths = {},
        compileStatus = "disable",  -- only in vscode
        -- typstExtraArgs = {},
        formatterMode = "typstyle", -- disable/typstyle/typstfmt
        formatterPrintWidth = 80,
        formatterIndentSize = 4,
        completion = {
            triggerOnSnippetPlaceholders = true,
            postfix = true,
            posfixUfcs = true,
            posfixUfcsLeft = true,
            posfixUfcsRight = true,
        },
        preview = {
            browsing = {
                args = { "--data-plane-host=127.0.0.1:0", "--invert-colors=auto", "--open" },
            },
            background = {
                enabled = false,
                args = { "--data-plane-host=127.0.0.1:23635", "--invert-colors=auto" },
            },
        },
    },
}
