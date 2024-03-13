return {
    { 'tpope/vim-fugitive',       cmd = { 'G' } },
    { 'tpope/vim-commentary',     keys = { 'gc', mode = { 'n', 'v' } } },
    { 'tpope/vim-surround',       keys = { 'ys', 'ds', 'cs' } },
    { 'tpope/vim-rsi',            event = { "InsertEnter", "CmdLineEnter" } },
    { "farmergreg/vim-lastplace", event = "VeryLazy" },

    -- { 'tpope/vim-rhubarb' },
    -- { 'tpope/vim-dispaatch' },
    -- {
    --     'justinmk/vim-sneak',
    --     keys = { 's', 'S' },
    --     config = function()
    --         local m = require('keymap')
    --         vim.cmd([[
    --           let g:sneak#label = 1
    --           let g:sneak#use_ic_scs = 1
    --           let g:sneak#absolute_dir = 1
    --         ]])
    --         m.n('s', '<Plug>Sneak_s', { noremap = false })
    --     end
    -- },
}
