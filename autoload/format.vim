" ========= \t 将tab替换为空格 ========== {{{
function format#RemoveTabs()
    let l:winview = winsaveview()
    silent! %s/\t/\=repeat(" ", &tabstop)/
    call winrestview(l:winview)
endfunction
"}}}

" ========= \b 去除所有尾部空白(blank) ========= {{{
" http://vim.wikia.com/wiki/remove_unwanted_spaces
function format#StripTrailingBlank()
    let l:winview = winsaveview()
    silent! %s/\s\+$//
    call winrestview(l:winview)
endfunction

"function! RemoveTrailingWhitespace()
"    if &ft != "diff"
"        let b:curcol = col(".")
"        let b:curline = line(".")
"        silent! %s/\s\+$//
"        silent! %s/\(\s*\n\)\+\%$//
"        call cursor(b:curline, b:curcol)
"    endif
"endfunction
"
"autocmd BufWritePre * call RemoveTrailingWhitespace()
"}}}

" ========= clang-format ========= {{{
function format#FormatFile()
    let l:lines="all"
    pyf ~/.vim/.draft/clang-format.py
endfunction
"}}}

" ======== 插入文件头 ======= {{{
function! format#AutoSetFileHead()
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
    endif
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/python3")
    endif

    normal G
    normal o
    normal o
endfunc
"}}}

" 为c/c++添加宏定义 #ifdef, #define, #endif {{{
function! InsertHeadDef(firstLine, lastLine)
    " 判断firstLine与lastLine范围是否正确
    if a:firstLine<1 || a:lastLine>line('$')
        echoerr 'InsertHeadDef : Range overflow !(FirstLine:' . a:firstLine
                                              \.';LastLine:'.a:lastLine
                                              \.';ValidRange:1~'.line('$').')'
        return ''
    endif
    " 构造宏
    let sourcefilename = expand("%:t")
    let definename = substitute(sourcefilename,' ','','g')
    let definename = substitute(definename,'\.','_','g')
    let definename = toupper(definename)
    " 插入宏定义
    exe 'normal '.a:firstLine.'GO'
    call setline('.', '#ifndef '.definename."_")
    exe 'normal == o'
    call setline('.', '#define '.definename."_")
    exe 'normal =='.(a:lastLine-a:firstLine+1).'jo'
    call setline('.', '#endif')
    " 格式化
    let goLn = a:firstLine+2
    exe 'normal =='.goLn.'G'
endfunction

function! format#InsertHeadDefN()
    let firstLine = 1
    let lastLine = line('$')
    " 跳过注释
    let n = 1
    while 1
        let line = getline(n)
        if n==1
            if line =~ '^\/\*.*$'
                let n = n + 1
                continue
            else
                break
            endif
        endif
        if line =~ '^.*\*\/$'
            let firstLine = n+1
            break
        endif
        let n = n + 1
    endwhile
    " 插入宏定义
    call InsertHeadDef(firstLine, lastLine)
endfunction
"}}}

" ======== 自动插入html模板 ======= {{{
function! format#AutoInsertTemplate()
    call setline(1, "\<!DOCTYPE HTML>")
    call append(1, "\<html lang=\"zh-CN\">")
    call append(2, "\<head>")
    call append(3, "\  <meta charset=\"UTF-8\">")
    call append(4, "\  <title></title>")
    call append(5, "\</head>")
    call append(6, "\<body>")
    call append(7, "\</body>")
    call append(8, "\</html>")
endfunc
"}}}
