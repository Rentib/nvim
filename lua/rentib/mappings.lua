vim.g.mapleader = ","

local m = require("keymap")

-- {{{ Insert mode
m.i("<bs>",      "<nop>") -- i need to learn to press i_CTRL-H
m.i("<left>",    "<nop>")
m.i("<down>",    "<nop>")
m.i("<up>",      "<nop>")
m.i("<right>",   "<nop>")
m.i("<c-left>",  "<nop>")
m.i("<c-down>",  "<nop>")
m.i("<c-up>",    "<nop>")
m.i("<c-right>", "<nop>")
-- }}} 

m.n("<leader>w", "<cmd>w<cr>")
m.n("<leader>q", "<cmd>wq<cr>")
m.n("<leader>c", function()
    if vim.fn.filereadable("Makefile") == 1 or vim.fn.filereadable("makefile") == 1 then
        vim.cmd("make")
    else
        vim.cmd("!compiler %")
    end
end)

m.n("<left>",  "<c-w><")
m.n("<down>",  "<c-w>-")
m.n("<up>",    "<c-w>+")
m.n("<right>", "<c-w>>")

m.n("<c-q>",     "<C-w>q")
m.n("<c-space>", "<C-w>H")

m.n("[q", "<cmd>cprevious<cr>zz")
m.n("[Q", "<cmd>cfirst<cr>zz")
m.n("]q", "<cmd>cnext<cr>zz")
m.n("]Q", "<cmd>clast<cr>zz")

m.n("ZZ", "<nop>")

-- smart indentation with 'i',
m.n('i', function()
    if vim.v.count <= 1 and vim.fn.match(vim.fn.getline('.'), "\\v[^[:space:]]") == -1 then
        return "\"_cc"
    end
    return 'i'
end, { expr = true })

-- inlay hints
m.n("<leader>lh", function()
    if pcall(vim.lsp.inlay_hint.enable, vim.lsp.inlay_hint.is_enabled()) then
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    else
        vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled())
    end
end)

m.n("<m-j>", ":m+1<cr>")
m.n("<m-k>", ":m-2<cr>")
m.v("<m-j>", ":m'>+<cr>gv=gv")
m.v("<m-k>", ":m-2<cr>gv=gv")

m.v('<', "<gv")
m.v('>', ">gv")

-- These are nice, but conflict with around and inner,
-- m.v("i", function()
--     return vim.api.nvim_get_mode()["mode"] == "" and "I" or "i"
-- end, { expr = true, nowait = true })
-- m.v("a", function()
--     return vim.api.nvim_get_mode()["mode"] == "" and "A" or "a"
-- end, { expr = true, nowait = true })

m.t("<esc>", "<c-\\><c-n>")

-- lsp mappings
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(e)
        local opts = { noremap = true, silent = true, buffer = e.buf }
        m.n("<space>ca", vim.lsp.buf.code_action,     opts)
        m.n("<space>cn", vim.lsp.buf.rename,          opts)
        m.n("gd",        vim.lsp.buf.definition,      opts)
        m.n("gD",        vim.lsp.buf.declaration,     opts)
        m.n("gT",        vim.lsp.buf.type_definition, opts)

        vim.api.nvim_create_user_command("Format", function() vim.lsp.buf.format { async = true } end, {})
    end
})
