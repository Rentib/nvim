vim.g.mapleader = ","

local m = require('keymap')

m.n('<leader>w', '<cmd>w<cr>')
m.n('<leader>q', '<cmd>wq<cr>')
m.n('<leader>c', '<cmd>!compiler %<cr>')

m.n('<left>',  '<cmd>vertical resize -2<cr>')
m.n('<down>',  '<cmd>resize +2<cr>')
m.n('<up>',    '<cmd>resize -2<cr>')
m.n('<right>', '<cmd>vertical resize +2<cr>')

m.n('<c-q>',     '<C-w>q')
m.n('<c-space>', '<C-w>H')

m.n('[q', '<cmd>cprevious<cr>zz')
m.n('[Q', '<cmd>cfirst<cr>zz')
m.n(']q', '<cmd>cnext<cr>zz')
m.n(']Q', '<cmd>clast<cr>zz')

m.n('ZZ', '<nop>')

-- smart indentation with 'i',
m.n('i', function()
    if vim.v.count <= 1 and vim.fn.match(vim.fn.getline('.'), '\\v[^[:space:]]') == -1 then
        return '"_cc'
    end
    return 'i'
end, { expr = true })

m.v('<', '<gv')
m.v('>', '>gv')

m.v("i", function()
    return vim.api.nvim_get_mode()["mode"] == "" and "I" or "i"
end, { expr = true, nowait = true })

m.v("a", function()
    return vim.api.nvim_get_mode()["mode"] == "" and "A" or "a"
end, { expr = true, nowait = true })

m.t('<esc>', '<c-\\><c-n>')

-- lsp mappings
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(e)
        local opts = { noremap = true, silent = true, buffer = e.buf }
        m.n("<space>ca", vim.lsp.buf.code_action, opts)
        m.n("<space>cn", vim.lsp.buf.rename, opts)
        m.n("gd", vim.lsp.buf.definition, opts)
        m.n("gD", vim.lsp.buf.declaration, opts)
        m.n("gT", vim.lsp.buf.type_definition, opts)
        m.n("K", vim.lsp.buf.hover, opts)
        m.i("<C-h>", vim.lsp.buf.signature_help, opts)

        vim.api.nvim_create_user_command("Format", function() vim.lsp.buf.format { async = true } end, {})
    end
})
