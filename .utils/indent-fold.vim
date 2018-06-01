"打开文件时默认不折叠代码
set nofoldenable
setlocal foldmethod=expr
setlocal foldexpr=GetPythonFold(v:lnum)

" 返回lnum行之后第一个非空行的行号， 如果没有，返回-2
function! NextNonBlankLine(lnum)
    let numlines = line('$')
    let current = a:lnum + 1

    while current <= numlines
        if getline(current) =~? '\v\S'
            return current
        endif

        let current += 1
    endwhile

    return -2
endfunction

" 获取lnum行的缩进等级
function! IndentLevel(lnum)
    return indent(a:lnum) / &shiftwidth
endfunction

" 根据行号lnum 返回foldlevel
function! GetPythonFold(lnum)
    " 空行返回-1
    if getline(a:lnum) =~? '\v^\s*$'
        return '-1'
    endif

    " 当前行的缩进等级
    let this_indent = IndentLevel(a:lnum)
    " 下一个非空行的缩进等级
    let next_indent = IndentLevel(NextNonBlankLine(a:lnum))

    if next_indent == this_indent
        return this_indent
    elseif next_indent < this_indent
        return this_indent
    elseif next_indent > this_indent
        return '>' . next_indent
    endif
endfunction
