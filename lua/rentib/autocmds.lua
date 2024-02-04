local cmd = vim.cmd

cmd('autocmd BufWritePost !zathura *.pdf')
cmd('autocmd BufWritePost Xresources !xrdb %')

cmd('autocmd BufRead,BufNewFile *.h set filetype=c')
