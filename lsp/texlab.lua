return {
    cmd = { "texlab" },
    filetypes = { "tex", "plaintex", "bib" },
    root_markers = { ".git" },
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
}
