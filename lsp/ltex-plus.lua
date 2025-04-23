local filetypes = { "bib", "markdown", "plaintex", "tex" }

return {
    cmd = { "ltex-ls-plus" },
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
