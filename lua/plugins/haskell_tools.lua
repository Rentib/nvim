return {
    'mrcjkb/haskell-tools.nvim',
    ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' },
    config = function()
        local ht = require('haskell-tools')
        local bufnr = vim.api.nvim_get_current_buf()
        local opts = { buffer = bufnr, }

        local m = require('keymap')

        m.n('<space>cl',  vim.lsp.codelens.run, opts)
        m.n('<space>hs',  ht.hoogle.hoogle_signature, opts)
        m.n('<space>ea',  ht.lsp.buf_eval_all, opts)
        m.n('<leader>rr', ht.repl.toggle, opts)
        m.n('<leader>rf', function()
            ht.repl.toggle(vim.api.nvim_buf_get_name(0))
        end, opts)
        m.n('<leader>rq', ht.repl.quit, opts)
    end
}
