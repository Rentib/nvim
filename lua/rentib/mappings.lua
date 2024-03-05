vim.g.mapleader = ","

local mappings = {
    { 'n', '<leader>w', '<cmd>w<cr>' },
    { 'n', '<leader>q', '<cmd>wq<cr>' },
    { 'n', '<leader>c', '<cmd>!compiler %<cr>' },

    { 'v', '<', '<gv' },
    { 'v', '>', '>gv' },

    { 'n', '<left>',  '<cmd>vertical resize -2<cr>' },
    { 'n', '<down>',  '<cmd>resize +2<cr>' },
    { 'n', '<up>',    '<cmd>resize -2<cr>' },
    { 'n', '<right>', '<cmd>vertical resize +2<cr>' },

    { 'n', '<c-q>',     '<C-w>q' },
    { 'n', '<c-space>', '<C-w>H' },

    { 'n', '[q', '<cmd>cprevious<cr>zz' },
    { 'n', '[Q', '<cmd>cfirst<cr>zz' },
    { 'n', ']q', '<cmd>cnext<cr>zz' },
    { 'n', ']Q', '<cmd>clast<cr>zz' },

    { 'n', 'ZZ', '<nop>' },

    -- smart indentation with 'i', 
    { 'n', 'i', function() -- https://stackoverflow.com/questions/3003393
        if vim.v.count <= 1 and vim.fn.match(vim.fn.getline('.'), '\\v[^[:space:]]') == -1 then
            return '"_cc'
        end
        return 'i'
    end, { expr = true } },

    { 't', '<esc>', '<c-\\><c-n>' }
}

for _, m in ipairs(mappings) do
    local opts = { noremap = true, silent = true }
    if m[4] then opts = vim.tbl_extend('force', opts, m[4]) end
    vim.keymap.set(m[1], m[2], m[3], opts)
end

-- lsp mappings
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(e)
        local opts = { noremap = true, silent = true, buffer = e.buf }
        vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<space>cn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

        vim.api.nvim_create_user_command("Format", function() vim.lsp.buf.format { async = true } end, {})
    end
})
