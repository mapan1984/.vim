" 不同语言的注释符号 {{{
let s:comment = {
            \"c":"// ",
            \"cpp":"// ",
            \"javascript":"// ",
            \"jquery":"// ",
            \"python":"# ",
            \"vim":'" ',
            \"sh":"# ",
            \"scheme":";; ",
            \}
let s:esc_comment = {
            \"c":'\/\/ ',
            \"cpp":'\/\/ ',
            \"javascript":'\/\/ ',
            \"jquery":'\/\/ ',
            \"python":'# ',
            \"vim":'" ',
            \"sh":'# ',
            \"scheme":';; ',
            \}
"}}}

" 单行注释 {{{
function! comment#Comment()
    let l:winview = winsaveview()
    let l:line = getline(line("."))
    let l:comment = s:comment[&ft]
    " 如果已被注释
    if l:line =~ '\v^\s*' . l:comment . '.*$'
        " 删除注释
        exec "normal! ^" . repeat("x", len(l:comment))
    else
        " 否则增加注释
        exec "normal! I" . l:comment
    endif
    call winrestview(l:winview)
endfunction
"}}}

" 多行注释 {{{
function! comment#MultiLineComment()
    let l:winview = winsaveview()
    let l:start = line("'<")
    let l:end = line("'>")
    let l:comment = s:comment[&ft]
    let l:esc_comment = s:esc_comment[&ft]
    " 如果已被注释
    if getline(l:start) =~ '\v^\s*' . l:comment . '.*$'
        " 则删除注释
        execute "normal! :" . (l:start) . ',' . (l:end) . 'g/' . l:esc_comment . '/s/' . l:esc_comment . '//' . "\<cr>"
    else
        " 否则增加注释
        execute 'normal! :' . (l:start) . ',' . (l:end) . 'g/./s/^/' . l:esc_comment . '/' . "\<cr>"
    endif
    call winrestview(l:winview)
endfunction
"}}}
