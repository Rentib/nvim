let g:tex_flavor='latex'
let g:tex_comment_nospell=1

setlocal spell

autocmd VimLeave *.tex :VimtexClean

let g:vimtex_view_method='zathura_simple'
let g:vimtex_compiler_method='latexmk'
let g:vimtex_format_enabled=1
let g:vimtex_syntax_conceal_disable=1
