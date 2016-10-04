" ========= 加注释 取消注释 ========= {{{
func! Add_Comment()
    if &filetype ==# "c" || &filetype ==# "cpp" || &filetype ==# "javascript"
        exec "normal! I//" . "\<esc>"
    elseif &filetype ==# "python" || &filetype ==# "sh"
        exec "normal! I#" . "\<esc>"
    elseif &filetype ==# "vim"
        exec "normal! I\" " . "\<esc>"
    elseif &filetype ==# "scheme"
        exec "normal! I;;" . "\<esc>"
    endif
endfunc

func! Clean_Comment()
    if &filetype ==# "c" || &filetype ==# "cpp" || &filetype ==# "javascript"
        exec "normal! ^xx"
    elseif &filetype ==# "python" || &filetype ==# "sh"
        exec "normal! ^x"
    elseif &filetype ==# "vim"
        exec "normal! ^xx"
    elseif &filetype ==# "scheme"
        exec "normal! ^xx"
    endif
endfunc

inoremap <leader>ac <ESC>:call Add_Comment()<CR>
inoremap <leader>cc <ESC>:call Clean_Comment()<CR>
vnoremap <leader>ac <ESC>:call Add_Comment()<CR>
vnoremap <leader>cc <ESC>:call Clean_Comment()<CR>
nnoremap <leader>ac :call Add_Comment()<CR>
nnoremap <leader>cc :call Clean_Comment()<CR>
"}}}

" ========= 代码缩写 ========= {{{
augroup snippet
    autocmd!
    "在末尾加分号
    autocmd FileType c,cpp,javascript noremap <buffer> <localleader>; A;<esc>o
    "自动扩展if
    autocmd FileType javascript,c,cpp :iabbrev <buffer> iff if()<left>
    autocmd FileType python           :iabbrev <buffer> iff if:<left>
    " 自动扩展for
    autocmd filetype c,cpp :iabbrev <buffer> forr for()<left>
augroup end
"}}}

" ======== 自动插入文件头 ======= {{{
autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"

function! AutoSetFileHead()
    if &filetype == 'sh'
        call setline(1, "\#!/bin/env bash")
    endif
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python3")
        call append(1, "\# encoding: utf-8")
    endif

    normal G
    normal o
    normal o
endfunc
"}}}
