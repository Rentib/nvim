local g   = vim.g
local opt = vim.opt

g.loaded_node_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
g.loaded_netrwPlugin   = 1

g.did_load_filetypes = 0
g.do_filetype_lua    = 1

opt.filetype.plugin = true
opt.filetype.indent = true

-- opt.shortmess:append "sI" -- disable nvim intro

local options = {
  fileencoding = "utf-8",
  spelllang    = "pl,en",

  backup   = false,
  swapfile = false,
  undofile = false,

  backspace = "indent,eol,start",  -- better backspace
  confirm   = true,

  updatetime = 250,

  wildmenu    = true,
  wildignore  = { "*.o" },
  wildmode    = "longest:full",
  wildoptions = "pum",

  showmode = false,
  showcmd  = true,

  number         = true,  -- line numbers
  relativenumber = false, -- line numbers relative to the line with the cursor
  numberwidth    = 2,     -- minimal number of columns used for displaying numbers
  signcolumn     = "yes", -- some magic
  ruler          = false, -- show line and column with cursor in statusline

  incsearch  = true,
  hlsearch   = true,
  ignorecase = true,
  smartcase  = true,

  autoindent  = true,  -- uses indent from the previous line
  smartindent = true,  -- lke autoindent but recognizes some C syntax
  cindent     = true,  -- enables automatic C program indentation
  shiftwidth  = 2,     -- number of spaces to use for indentation
  tabstop     = 2,     -- number of spaces that a <Tab> in the file counts for
  softtabstop = 2,     -- number of spaces that a <Tab> counts for while performing editing
  expandtab   = true,  -- change tabs to spaces
  shiftround  = false, -- round indent to multiple of 'shiftwidth'

  clipboard = "unnamedplus",
  mouse     = "a",

  formatoptions = "cqrn1j",
  wrap          = false,
  scrolloff     = 8,
  sidescrolloff = 8,

  termguicolors = true,
  syntax        = "on",
  background    = "dark",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
