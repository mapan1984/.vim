" ========= html autocmd ========= {{{
" 用autocmd！清除同名的自动命令
augroup filetype_html
    autocmd!
    autocmd BufNewFile *.html execute "normal! i<html>\<cr>".
                \"<head>\<cr>".
                \"</head>\<cr>".
                \"<body>\<cr>\<cr>".
                \"</body>\<cr>".
                \"</html>\<esc>"."ggjo"
    autocmd FileType html setlocal wrap linebreak
    autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
    "保存文件前，读取前,格式化
    "autocmd BufWritePre,BufRead *.html :normal! gg=G
    autocmd FileType html :iabbrev <buffer> < &ldquo;
    autocmd FileType html :iabbrev <buffer> > &rdquo;
augroup end "}}}

" ========= markdown autocmd ========= {{{
augroup filetype_markdown
    autocmd!
    " wrap at a character in the breakat option
    autocmd FileType markdown :setlocal wrap linebreak
    " 在markdown中定位到' ^==+$\r '，使用cih(change inside heading)
    autocmd FileType markdown onoremap ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
    " cah(change around heading)
    autocmd FileType markdown onoremap ah :<c-u>execute "normal! ?^==\\+\r:nohlsearch\rg_vk0"<cr>
    " 缩写
    autocmd FileType markdown :iabbrev <buffer> @@ mapan1984@outlook.com
    autocmd FileType markdown :iabbrev <buffer> link []()<esc>2hi
    autocmd FileType markdown :iabbrev <buffer> kbd <kbd></kbd><esc>b2hi
augroup end "}}}

" ========= coding autocmd ========== {{{
augroup coding
    autocmd!
    " 自动加#!
    autocmd BufNewFile *.sh :normal! i#!/bin/bash\<esc>o
    autocmd BufNewFile *.py execute "normal! i#!/usr/bin/env python3\<esc>o".
                                            \"# -*- coding: utf-8 -*-\<esc>o"
    "在末尾加分号
    autocmd FileType c,cpp,javascript noremap <leader>; A;<esc>
    "自动扩展if
    autocmd FileType javascript,c,cpp :iabbrev <buffer> iff if ()<left>
    autocmd FileType python           :iabbrev <buffer> iff if:<left>
augroup end "}}}

augroup invisible_chars "{{{
    autocmd!
    " Show invisible characters in all of these files
    autocmd filetype vim setlocal list
    autocmd filetype python setlocal list
    autocmd filetype ruby setlocal list
    autocmd filetype javascript,css setlocal list
augroup end "}}}

augroup vim_files "{{{
    autocmd!
    " Bind <F1> to show the keyword under cursor
    " general help can still be entered manually, with :h
    autocmd filetype vim noremap <buffer> <F1> <Esc>:help <C-r><C-w><CR>
    autocmd filetype vim noremap! <buffer> <F1> <Esc>:help <C-r><C-w><CR>
augroup end "}}}

" Restore cursor position upon reopening files {{{
autocmd BufReadPost *
    \ if &filetype != "gitcommit" && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
" }}}
