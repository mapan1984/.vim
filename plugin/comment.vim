 " ========= 加注释 取消注释 ========= 
let s:comment = {
            \"c":"//",
            \"cpp":"//",
            \"javascript":"//",
            \"jqury":"//",
            \"python":"#",
            \"vim":'"',
            \"sh":"#",
            \"scheme":";;",
            \}

function! Comment()
    let l:winview = winsaveview()
    let l:line = getline(line("."))
    " 如果已被注释
    if l:line =~ '\v^\s*' . s:comment[&ft] . '.*$'
        " 删除注释
        let l:commentlen = len(s:comment[&ft])
        exec "normal! ^" . repeat("x", l:commentlen+1)
    else
        " 否则增加注释
        exec "normal! i" . s:comment[&ft] ." "
    endif
    call winrestview(l:winview)
endfunction

function! VComment()
    let l:winview = winsaveview()
    let l:start = line("'<")
    let l:end = line("'>")
    " 如果已被注释
    if getline(l:start) =~ '\v^\s*' . s:comment[&ft] . '.*$'
        " 删除注释
        execute "normal! :" . (l:start) . ',' . (l:end) . 'g/' . (s:comment[&ft]) . '/s/' . (s:comment[&ft]) . '//' . "\<cr>"
    else
        " 否则增加注释
        execute 'normal! :' . (l:start) . ',' . (l:end) . 'g/./s/^/' . s:comment[&ft] . '/' . "\<cr>"
    endif
    call winrestview(l:winview)
endfunction

"inoremap <c-/> <esc> :call Comment()<cr>
"nnoremap <c-/> :call Comment()<CR>
inoremap  <esc> :call Comment()<cr>
nnoremap  :call Comment()<cr>
vnoremap  :<c-u>call VComment()<cr>
