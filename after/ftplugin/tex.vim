let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_compiler_method='latexmk'
let g:tex_comment_nospell=1

setlocal spell

autocmd VimLeave *.tex :VimtexClean
