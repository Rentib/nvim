local opt = vim.opt_local -- to set options

opt.textwidth     = 79
opt.colorcolumn   = "80"
opt.formatoptions = opt.formatoptions
  + "c" -- autowrap comments
  + "r" -- auto insert comment after enter
  + "q" -- autoformat comments
  + "n" -- recognise lists
  + "1" -- dont break lines after one-letter word
  + "j" -- remove unnecessary comment leaders
  + "l" -- dont break long lines
  - "t" -- autowrap text
  - "o" -- dont insert comment otherwise
  - "w" -- no trailing white space
  - "a" -- dont autoformat paragraphs
  - "2" -- no magic

opt.shiftwidth  = 8
opt.tabstop     = 8
opt.softtabstop = 8
opt.expandtab   = false
