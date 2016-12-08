" 添加宏定义 #ifdef, #define, #endif {{{
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

function! InsertHeadDefN()
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

nnoremap <buffer> <localleader>hd :call InsertHeadDefN()<CR>
"}}}

" snippet
:source ~/.vim/ftplugin/c.vim
