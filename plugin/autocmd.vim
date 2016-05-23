augroup coding "{{{
    autocmd!
    autocmd BufNewFile *.html execute "normal! i<html>\<cr>".
                                              \"<head>\<cr>".
                                              \"</head>\<cr>".
                                              \"<body>\<cr>\<cr>".
                                              \"</body>\<cr>".
                                              \"</html>\<esc>"."ggjo"
    "保存文件前，读取前,格式化
    "autocmd BufWritePre,BufRead *.html :normal! gg=G
    "在末尾加分号
    autocmd FileType c,cpp,javascript noremap <buffer> <leader>; A;<esc>
    "自动扩展if
    autocmd FileType javascript,c,cpp :iabbrev <buffer> iff if ()<left>
    autocmd FileType python           :iabbrev <buffer> iff if:<left>
    " 自动扩展for
    autocmd filetype c,cpp :iabbrev <buffer> forr for ()<left>
augroup end "}}}

augroup invisible_chars "{{{
    autocmd!
    " Show invisible characters in all of these files
    autocmd filetype vim setlocal list
    autocmd filetype python setlocal list
augroup end "}}}

" 打开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写 {{{
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif " }}}
