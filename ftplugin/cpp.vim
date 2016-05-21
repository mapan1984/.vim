" 添加宏定义 #ifdef, #define, #endif {{{
function InsertHeadDef(firstLine, lastLine)
    if a:firstLine <1 || a:lastLine> line('$')
        echoerr 'InsertHeadDef : Range overflow !(FirstLine:'.a:firstLine.';LastLine:'.a:lastLine.';ValidRange:1~'.line('$').')'
        return ''
    endif
    let sourcefilename=expand("%:t")
    let definename=substitute(sourcefilename,' ','','g')
    let definename=substitute(definename,'\.','_','g')
    let definename = toupper(definename)
    exe 'normal '.a:firstLine.'GO'
    call setline('.', '#ifndef _'.definename."_")
    normal ==o
    call setline('.', '#define _'.definename."_")
    exe 'normal =='.(a:lastLine-a:firstLine+1).'jo'
    call setline('.', '#endif')
    let goLn = a:firstLine+2
    exe 'normal =='.goLn.'G'
endfunction

function InsertHeadDefN()
    let firstLine = 1
    let lastLine = line('$')
    let n=1
    while n < 20
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
    call InsertHeadDef(firstLine, lastLine)
endfunction

nnoremap ,ha :call InsertHeadDefN()<CR>
"}}}

" 自动在运算符两侧加空格
iabbrev <buffer> <= <space><=<space>
iabbrev <buffer> *= <space>*=<space>
iabbrev <buffer> /= <space>/=<space>
iabbrev <buffer> >> <space>>><space>
iabbrev <buffer> << <space><<<space>
iabbrev <buffer> >= <space>>=<space>
iabbrev <buffer> == <space>==<space>
iabbrev <buffer> += <space>+=<space>
iabbrev <buffer> && <space>&&<space>
iabbrev <buffer> != <space>!=<space>

" 删除到下一个return
onoremap <buffer> r /return<cr>
