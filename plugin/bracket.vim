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
" function! RemovePairs()
"     let l:previous_char = getline(".")[col(".")-1]  " 取得当前光标前一个字符
"
"     if index(["(", "[", "{"], l:previous_char) != -1 " 当前光标的前一个字符是左括号
"         let l:original_pos = getpos(".")
"         execute "normal %"
"         let l:new_pos = getpos(".")
"
"         " 如果没有匹配的右括号
"         if l:original_pos == l:new_pos
"             execute "normal! a\<BS>"
"             return
"         end
"
"         let l:line2 = getline(".")
"         if len(l:line2) == col(".")
"             " 如果右括号是当前行最后一个字符
"             execute "normal! v%xa"
"         else
"             " 如果右括号不是当前行最后一个字符
"             execute "normal! v%xi"
"         end
"
"     else " 当前光标的前一个字符不是左括号
"         execute "normal! a\<BS>"
"     end
" endfunction
"
" inoremap <BS> <ESC>:call RemovePairs()<CR>a

" 输入一个右括号时，如果下一个字符也是相同右括号，则跳过
function! RemoveNextDoubleChar(char)
    let l:next_char = getline(".")[col(".")] " 取得当前光标后一个字符

    if a:char == l:next_char
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
