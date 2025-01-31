local g, o, opt        = vim.g, vim.o, vim.opt

g.vimsyn_embed         = "l" -- highlight lua in vimscript

g.loaded_node_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

opt.filetype.plugin    = true
opt.filetype.indent    = true

o.fileencoding         = "utf-8"
o.spelllang            = "pl,en"
o.spelloptions         = "camel"

opt.backupdir:remove(".")
o.backup     = true
o.swapfile   = false
o.undofile   = true
o.autoread   = true

o.backspace  = "indent,eol,start"
o.confirm    = true

o.updatetime = 250

opt.completeopt:append({ "menuone", "preview", "popup", "fuzzy", "noinsert", "noselect" })
o.wildmenu = true
opt.wildignore:append({ "*.o", "__pycache__", "*.pyc", "*pycache", "*.jpg", "*.png", "*.gif", "*.pdf" })
o.wildignorecase = true
o.wildmode       = "longest:full"
o.wildoptions    = "pum"

o.laststatus     = 0
o.showtabline    = 1
o.tabline        = ""
o.ruler          = true
o.showmode       = true
o.showcmd        = true
o.display        = "lastline,truncate"

o.number         = true
o.relativenumber = true
o.numberwidth    = 2
o.signcolumn     = "yes"
o.cursorline     = true
o.cursorlineopt  = "number"
o.colorcolumn    = "+1"

o.incsearch      = true
o.hlsearch       = true
o.ignorecase     = true
o.smartcase      = true
o.inccommand     = "split"

o.autoindent     = true
o.smartindent    = true
o.cindent        = true
o.shiftwidth     = 4
o.tabstop        = 4
o.softtabstop    = 4
o.expandtab      = true
o.shiftround     = true

o.clipboard      = "unnamedplus"

o.mouse          = "nvi"
o.mousemoveevent = false
o.mousemodel     = "popup"

opt.shortmess:append("c")

o.textwidth = 80
o.linebreak = true
o.wrap      = false

vim.cmd [[ au FileType * setlocal formatoptions=crqn1]jp ]] -- https://stackoverflow.com/questions/28375119/how-to-override-options-set-by-ftplugins-in-vim
-- o.formatoptions = o.formatoptions + "crqn1]jp" - "to/wa2vblmMB"

o.sidescroll    = 1
o.scrolloff     = 7
o.sidescrolloff = 8

o.virtualedit   = "block"
o.magic         = true
o.foldmethod    = "marker"
o.nrformats     = "bin,hex"

o.termguicolors = true
