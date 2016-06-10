" 对Vim使用标记进行折叠，默认标记是 {{{ 和 }}}
setlocal foldmethod=marker
setlocal list

" Bind <F1> to show the keyword under cursor
noremap! <buffer> <F1> <Esc>:help <C-r><C-w><CR>
