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

    -- prevent cursor from moving
    -- { 'i', '<esc>', '<esc>`^' },
    -- { 'i', '<C-c>', '<esc>`^' },

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
