local filetypes = { "bib", "gitcommit", "markdown", "plaintex", "rst", "tex", "pandoc", "rmd", "text" }

return {
    cmd = { "ltex-ls" },
    filetypes = filetypes,
    root_markers = { ".git" },
    flags = { debounce_text_changes = 300 },
    settings = {
        ltex = {
            enabled = filetypes,
            language = "en-GB",
            additionalRules = {
                enablePickyRules = true,
                motherTongue = "pl-PL",
            },
            -- completionEnabled = true,
            checkFrequency = "save",
        },
    },
}
