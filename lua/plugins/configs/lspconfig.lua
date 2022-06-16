local present, lspconfig = pcall(require, "lspconfig")

if not present then
  return
end

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d",        vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d",        vim.diagnostic.goto_next)

-- LSP settings
local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr }
  vim.keymap.set("n", "gD",         vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gd",         vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K",          vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gi",         vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "<C-k>",      vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "<Space>D",  vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "<Space>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "gr",         vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<Space>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<Space>so", require('telescope.builtin').lsp_document_symbols, opts)
  vim.api.nvim_create_user_command("Format", vim.lsp.buf.formatting, {})
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- Enable the following language servers
local servers = { "clangd" }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
