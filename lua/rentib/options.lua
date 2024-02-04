local g   = vim.g
local opt = vim.opt

local g_options = {
    loaded_node_provider = 0,
    loaded_perl_provider = 0,
    loaded_ruby_provider = 0,
}

for k, v in pairs(g_options) do
    g[k] = v
end

opt.filetype.plugin = true
opt.filetype.indent = true

local options = {
    fileencoding = 'utf-8',
    spelllang    = 'pl,en',

    backup   = false,
    swapfile = false,
    undofile = false,

    backspace = 'indent,eol,start',
    confirm   = true,

    updatetime = 250,

    completeopt = "menuone",
    wildmenu    = true,
    wildignore  = { '*.o' },
    wildmode    = 'longest:full',
    wildoptions = 'pum',

    laststatus  = 2,
    showtabline = 1,
    ruler       = true,
    showmode    = false,
    showcmd     = true,
    display     = 'lastline,truncate',

    number         = true,
    relativenumber = true,
    numberwidth    = 2,
    signcolumn     = 'yes',
    cursorline     = true,
    cursorlineopt  = 'number',

    incsearch  = true,
    hlsearch   = true,
    ignorecase = true,
    smartcase  = true,

    autoindent  = true,
    smartindent = true,
    cindent     = true,
    shiftwidth  = 4,
    tabstop     = 4,
    softtabstop = 4,
    expandtab   = true,
    shiftround  = false,

    clipboard = 'unnamedplus',
    mouse     = 'a',

    formatoptions = 'cqrn1j',

    wrap          = false,
    sidescroll    = 1,
    scrolloff     = 7,
    sidescrolloff = 8,

    termguicolors  = true,
    syntax         = 'on',
}

for k, v in pairs(options) do
    opt[k] = v
end
