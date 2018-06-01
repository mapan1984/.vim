" auto complete
inoremap ( ()<left>
inoremap (<cr> (<cr>)<esc>O
inoremap [ []<left>
inoremap [<cr> [<cr>]<esc>O
inoremap { {}<left>
inoremap {<cr> {<cr>}<esc>O
inoremap ' ''<left>
inoremap " ""<left>
inoremap ` ``<left>

" 按退格键时判断当前光标前一个字符，如果是左括号，则删除对应的右括号
function! RemovePairs()

    let l:prev_char = getline(".")[col(".")-1]  " 取得当前光标前一个字符

    if index(["(", "[", "{"], l:prev_char) != -1 " 当前光标的前一个字符是左括号
        let l:current_pos = getpos(".")
        execute "normal %"
        let l:match_pos = getpos(".")

        " 没有匹配的右括号，直接删除
        if l:current_pos == l:match_pos
            execute "normal! a\<BS>"
            return
        end

        " 右括号是当前行最后一个字符
        if col('.') == col('$') - 1
            execute "normal! v%xa"
        else
            " 右括号不是当前行最后一个字符
            execute "normal! v%xi"
        end

    else " 当前光标的前一个字符不是左括号
        execute "normal! a\<BS>"
    end
endfunction

inoremap <BS> <ESC>:call RemovePairs()<CR>a
inoremap <c-h> <ESC>:call RemovePairs()<CR>a


" 输入一个右括号时，如果下一个字符也是相同右括号，则跳过
function! RemoveNextDoubleChar(char)
    " 取得当前光标后一个字符
    let l:next_char = getline(".")[col(".")]

    if a:char == l:next_char
        " 向后移动一个字符
        execute "normal! l"
    else
        if col(".") == 1
            execute "normal! i" . a:char
        else
            execute "normal! a" . a:char
        end
    end
endfunction

inoremap ) <ESC>:call RemoveNextDoubleChar(')')<CR>a
inoremap ] <ESC>:call RemoveNextDoubleChar(']')<CR>a
inoremap } <ESC>:call RemoveNextDoubleChar('}')<CR>a
