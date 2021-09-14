" ========= \t 将tab替换为空格 ========== {{{
function format#RemoveTabs()
    let l:winview = winsaveview()
    silent! %s/\t/\=repeat(" ", &tabstop)/g
    call winrestview(l:winview)
endfunction
"}}}

" ========= \b 去除所有尾部空白(blank) ========= {{{
" http://vim.wikia.com/wiki/remove_unwanted_spaces
function format#StripTrailingBlank()
    let l:winview = winsaveview()
    silent! %s/\s\+$//g
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
