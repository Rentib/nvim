local cmd = vim.cmd

cmd('autocmd BufWritePost !zathura *.pdf')
cmd('autocmd BufWritePost Xresources !xrdb %')
