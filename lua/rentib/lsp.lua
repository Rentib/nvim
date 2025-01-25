vim.lsp.enable("clangd")
vim.lsp.enable("lua_ls")
vim.lsp.enable("texlab")
vim.lsp.enable("ltex")
vim.lsp.enable("basedpyright")
vim.lsp.enable("ruff")
vim.lsp.enable("bashls")

vim.diagnostic.config({
    underline = true,
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    severity_sort = true,
})
