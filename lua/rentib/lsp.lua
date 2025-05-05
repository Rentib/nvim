vim.lsp.enable({
    "clangd",
    "lua_ls",
    "texlab",
    "ltex-plus",
    "basedpyright",
    "ruff",
    "bashls",
    "harper-ls",
    "tinymist",
})

vim.diagnostic.config({
    underline = true,
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    severity_sort = true,
})

vim.cmd("command! LspStop lua vim.lsp.stop_client(vim.lsp.get_clients())")
