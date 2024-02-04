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
}

for _, m in pairs(mappings) do
    vim.keymap.set(m[1], m[2], m[3], { noremap = true, silent = true })
end
