vim.g.mapleader = ","

local m = require("keymap")

m.n("<leader>w", "<cmd>w<cr>")
m.n("<leader>q", "<cmd>wq<cr>")

m.n("<left>",  "<c-w><")
m.n("<down>",  "<c-w>-")
m.n("<up>",    "<c-w>+")
m.n("<right>", "<c-w>>")

m.n("<c-q>", "<C-w>q")

-- smart indentation with 'i',
m.n('i', function()
    if vim.v.count <= 1 and vim.fn.match(vim.fn.getline('.'), "\\v[^[:space:]]") == -1 then
        return "\"_cc"
    end
    return 'i'
end, { expr = true })

m.n("<m-j>", ":m+1<cr>")
m.n("<m-k>", ":m-2<cr>")
m.v("<m-j>", ":m'>+<cr>gv=gv")
m.v("<m-k>", ":m-2<cr>gv=gv")

m.v('<', "<gv")
m.v('>', ">gv")

m.t("<esc>", "<c-\\><c-n>")

-- lsp mappings
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(e)
        -- defaults: grn - rename, grr - references, gri - implementation, g0 - document symbol, gra - code action
        local opts = { noremap = true, silent = true, buffer = e.buf }
        m.n("grn", vim.lsp.buf.rename,          opts)
        m.n("grr", vim.lsp.buf.references,      opts)
        m.n("gri", vim.lsp.buf.implementation,  opts)
        m.n("gO",  vim.lsp.buf.document_symbol, opts)
        m.n("gra", vim.lsp.buf.code_action,     opts)
    end
})

m.n("<leader>ih", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = 0 }, { bufnr = 0 })
end)

-- snippets
vim.keymap.set({"i", "s"}, "<esc>", function()
    if vim.snippet then
        vim.snippet.stop()
    end
    return "<esc>"
end, {expr = true, silent = true, noremap = true})

local function snip_jump(key, direction)
    if vim.snippet.active({direction = direction}) then
        return string.format("<cmd>lua vim.snippet.jump(%d)<cr>", direction)
    end
    return key
end
vim.keymap.set({"i", "s"}, "<c-j>", function() return  snip_jump("<c-j>",  1) end, {expr = true, silent = true, noremap = true})
vim.keymap.set({"i", "s"}, "<c-k>", function() return  snip_jump("<c-k>", -1) end, {expr = true, silent = true, noremap = true})
