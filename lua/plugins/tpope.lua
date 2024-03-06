return {
    { 'tpope/vim-fugitive',   cmd = { 'G' } },
    { 'tpope/vim-commentary', keys = { { 'gc', mode = { 'n', 'v' } } }, cmd = { "Commentary" } },
    { 'tpope/vim-surround',   keys = { 'ys', 'ds', 'cs' } },
    { 'tpope/vim-rsi',        event = { "InsertEnter", "CmdLineEnter" } },
    -- { 'tpope/vim-rhubarb' },
    -- { 'tpope/vim-dispaatch' },
    {
        'haya14busa/vim-edgemotion',
        keys = { { '<c-j>', '<c-k>' }, mode = { 'n', 'x', 'o' } },
        config = function()
            local m = require('keymap')

            m.n("<c-j>", "m'<Plug>(edgemotion-j)")
            m.n("<c-k>", "m'<Plug>(edgemotion-k)")
            m.x("<c-j>", "m'<Plug>(edgemotion-j)")
            m.x("<c-k>", "m'<Plug>(edgemotion-k)")
            m.o("<c-j>", "<Plug>(edgemotion-j)")
            m.o("<c-k>", "<Plug>(edgemotion-k)")
        end
    },
    {
        'justinmk/vim-sneak',
        keys = { 's', 'S' },
        config = function()
            local m = require('keymap')
            vim.cmd([[
              let g:sneak#label = 1
              let g:sneak#use_ic_scs = 1
              let g:sneak#absolute_dir = 1
            ]])
            m.n('s', '<Plug>Sneak_s', { noremap = false })
        end
    },
}
