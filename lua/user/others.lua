local g       = vim.g
local cmd     = vim.cmd
local autocmd = vim.api.nvim_create_autocmd

-- colorscheme
local colorscheme = "OceanicNext"
local colorscheme_present = pcall(vim.cmd, "colorscheme " .. colorscheme)
if colorscheme_present then
  vim.g.oceanic_next_terminal_italic = 1
  vim.g.oceanic_next_terminal_bold   = 1
  cmd("colorscheme " .. colorscheme)
end

-- latex
g.tex_flavor          = "latex"
g.vimtex_view_method  = "zathura"
g.tex_comment_nospell = 1
