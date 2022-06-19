local g   = vim.g
local cmd = vim.cmd

g.tex_flavor          = "latex"
g.vimtex_view_method  = "zathura"
g.tex_comment_nospell = 1

local local_options = {
  spell = true,
}

for k, v in pairs(local_options) do
  vim.opt_local[k] = v
end
