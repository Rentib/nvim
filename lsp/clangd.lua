return {
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
}
