local g       = vim.g
local cmd     = vim.cmd
local autocmd = vim.api.nvim_create_autocmd

-- colorscheme
local colorscheme = "gruvbox-material"
local colorscheme_present = pcall(vim.cmd, "colorscheme " .. colorscheme)
if colorscheme_present then
  if colorscheme == "OceanicNext" then
    vim.g.oceanic_next_terminal_italic = 1
    vim.g.oceanic_next_terminal_bold   = 1
  end
  cmd("colorscheme " .. colorscheme)
end

cmd("autocmd VimLeave *.tex !clearLatex %")
cmd("autocmd VimLeave *.java !clearJava %")

cmd("autocmd BufWritePost !zathura *.pdf")
cmd("autocmd BufWritePost Xresources !xrdb %")

cmd("autocmd BufRead,BufNewFile *.h set filetype=c") -- make .h files be detected as c files
