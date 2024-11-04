vim.g.mapleader = ","

local m = require("keymap")

m.n("<leader>w", "<cmd>w<cr>")
m.n("<leader>q", "<cmd>wq<cr>")

m.n("<left>",  "<c-w><")
m.n("<down>",  "<c-w>-")
m.n("<up>",    "<c-w>+")
m.n("<right>", "<c-w>>")

m.n("<c-q>",     "<C-w>q")

m.n("[q", "<cmd>cprevious<cr>zz")
m.n("[Q", "<cmd>cfirst<cr>zz")
m.n("]q", "<cmd>cnext<cr>zz")
m.n("]Q", "<cmd>clast<cr>zz")

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
        local opts = { noremap = true, silent = true, buffer = e.buf }
        m.n("<space>ca", vim.lsp.buf.code_action,     opts)
        m.n("<space>cn", vim.lsp.buf.rename,          opts)
        m.n("gd",        vim.lsp.buf.definition,      opts)
        m.n("gD",        vim.lsp.buf.declaration,     opts)
        m.n("gT",        vim.lsp.buf.type_definition, opts)

        vim.api.nvim_create_user_command("Format", function() vim.lsp.buf.format { async = true } end, {})
    end
})
