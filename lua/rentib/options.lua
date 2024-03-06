local g, o             = vim.g, vim.opt

g.vimsyn_embed         = 'l' -- highlight lua in vimscript

g.loaded_node_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

o.filetype.plugin      = true
o.filetype.indent      = true

vim.syntax             = 'on'

o.fileencoding         = 'utf-8'
o.spelllang            = 'pl,en'

o.backupdir:remove('.')
o.backup         = true
o.swapfile       = false
o.undofile       = false
o.autoread       = true

o.backspace      = 'indent,eol,start'
o.confirm        = true

o.updatetime     = 250

o.completeopt    = "menuone"
o.wildmenu       = true
o.wildignore     = { '*.o' }
o.wildmode       = 'longest:full'
o.wildoptions    = 'pum'

o.laststatus     = 2
o.showtabline    = 1
o.ruler          = true
o.showmode       = false
o.showcmd        = true
o.display        = 'lastline,truncate'

o.number         = true
o.relativenumber = true
o.numberwidth    = 2
o.signcolumn     = 'yes'
o.cursorline     = true
o.cursorlineopt  = 'number'

o.incsearch      = true
o.hlsearch       = true
o.ignorecase     = true
o.smartcase      = true
o.inccommand     = 'split'

-- o.list      = true
-- o.listchars = 'tab:▸ '

o.autoindent     = true
o.smartindent    = true
o.cindent        = true
o.shiftwidth     = 4
o.tabstop        = 4
o.softtabstop    = 4
o.expandtab      = true
o.shiftround     = false

o.clipboard      = 'unnamedplus'

o.mouse          = 'a'
o.mousemoveevent = false
o.mousemodel     = 'extend'

o.shortmess:append('c')
o.completeopt:append({
    'noinsert',
    'noselect',
    'menuone',
    'preview',
})

o.textwidth = 80
o.wrap      = false
vim.cmd [[ au FileType * setlocal formatoptions=crqn1]jp ]] -- https://stackoverflow.com/questions/28375119/how-to-override-options-set-by-ftplugins-in-vim
-- o.formatoptions = o.formatoptions + "crqn1]jp" - "to/wa2vblmMB"

o.sidescroll    = 1
o.scrolloff     = 7
o.sidescrolloff = 8

o.virtualedit   = "block"
o.magic         = true
o.foldmethod    = 'marker'
o.nrformats     = "bin,hex"

o.termguicolors = true
