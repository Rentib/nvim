local g = vim.g

g.tex_flavor             = 'latex'
g.vimtex_view_method     = 'zathura'
g.vimtex_compiler_method = 'latexmk'
g.tex_comment_nospell    = 1

local local_options = {
  spell = true,
}

for k, v in pairs(local_options) do
  vim.opt_local[k] = v
end

vim.cmd('autocmd VimLeave *.tex :VimtexClean')
