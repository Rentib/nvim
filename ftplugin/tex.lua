local g = vim.g

g.tex_flavor             = 'latex'
g.vimtex_view_method     = 'zathura'
g.vimtex_compiler_method = 'latexmk'
g.tex_comment_nospell    = 1

vim.opt_local.spell = true

vim.cmd('autocmd VimLeave *.tex :VimtexClean')
