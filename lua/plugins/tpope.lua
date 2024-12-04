return {
    { 'tpope/vim-fugitive',       cmd = { 'G' } },
    -- { 'tpope/vim-commentary',     keys = { { 'gc', mode = { 'n', 'v' } }, { 'gcc', mode = { 'n', 'v' } } } },
    -- { 'numToStr/Comment.nvim',    keys = { { 'gc', mode = { 'n', 'v' } }, { 'gcc', mode = { 'n', 'v' } } }, opts = {} },
    { 'tpope/vim-surround',       keys = { 'ys', 'ds', 'cs' } },
    { 'tpope/vim-rsi',            event = { "InsertEnter", "CmdLineEnter" } },
    { "farmergreg/vim-lastplace", lazy = false },

    -- https://github.com/tpope/vim-endwise
    -- https://github.com/tpope/vim-rhubarb
    -- https://github.com/tpope/vim-abolish
    -- https://github.com/tpope/vim-eunuch
}
