" 对Vim使用标记进行折叠，默认标记是 {{{ 和 }}}
setlocal foldmethod=marker

" 快速查找
setlocal keywordprg=:help
"nnoremap K :help <C-r><C-w><CR>

" Disable inserting comment leader after hitting o or O or <Enter>
setlocal formatoptions-=o
setlocal formatoptions-=r
