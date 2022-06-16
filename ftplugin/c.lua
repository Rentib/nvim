local opt = vim.opt -- to set options

opt.textwidth     = 79
opt.colorcolumn   = "80"
opt.formatoptions = opt.formatoptions
  - "t" -- autowrap text
  + "c" -- autowrap comments
  + "r" -- auto insert comment after enter
  - "o" -- dont insert comment otherwise
  + "q" -- autoformat comments
  - "w" -- no trailing white space
  - "a" -- dont autoformat paragraphs
  + "n" -- recognise lists
  - "2" -- no magic
  + "1" -- dont break lines after one-letter word
  + "j" -- remove unnecessary comment leaders
