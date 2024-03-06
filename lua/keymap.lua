local map = {}

function map.qnoremap(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.keymap.set(mode, lhs, rhs, options)
end

function map.a(lhs, rhs, opts) map.qnoremap('',  lhs, rhs, opts) end
function map.i(lhs, rhs, opts) map.qnoremap('i', lhs, rhs, opts) end
function map.c(lhs, rhs, opts) map.qnoremap('c', lhs, rhs, opts) end
function map.n(lhs, rhs, opts) map.qnoremap('n', lhs, rhs, opts) end
function map.x(lhs, rhs, opts) map.qnoremap('x', lhs, rhs, opts) end
function map.o(lhs, rhs, opts) map.qnoremap('o', lhs, rhs, opts) end
function map.t(lhs, rhs, opts) map.qnoremap('t', lhs, rhs, opts) end
function map.v(lhs, rhs, opts) map.qnoremap('v', lhs, rhs, opts) end

return map
