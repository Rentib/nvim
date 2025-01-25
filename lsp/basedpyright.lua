return {
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
}
