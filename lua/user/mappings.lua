local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = ","

map("n", "<Leader>w", "<Cmd>w<CR>", opts)
map("n", "<Leader>q", "<Cmd>wq<CR>", opts)
map("n", "<Leader>c", "<Cmd>w<CR><Cmd>!compiler %<CR>", opts)

map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- comment ctrl + /
map("n", "<C-_>", "<Cmd>Commentary<CR>", opts)
map("i", "<C-_>", "<Esc><Cmd>Commentary<CR>a", opts)

-- resizing windows
map("n", "<Left>", "<Cmd>vertical resize -2<CR>", opts)
map("n", "<Down>", "<Cmd>resize +2<CR>", opts)
map("n", "<Up>", "<Cmd>resize -2<CR>", opts)
map("n", "<Right>", "<Cmd>vertical resize +2<CR>", opts)

-- window navigation
map("n", "<C-Space>", "<C-w>H", opts)
map("n", "<C-j>", "<C-w>w", opts)
map("n", "<C-k>", "<C-w>W", opts)
map("n", "<C-q>", "<C-w>q", opts)
map("n", "<Leader>v", "<Cmd>vnew<CR>", opts)
map("n", "<Leader>h", "<Cmd>new<CR>", opts)
