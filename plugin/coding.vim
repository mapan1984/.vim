" ========= 加注释 取消注释 ========= {{{
func! AddComment()
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

func! CleanComment()
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

inoremap <leader>ac <ESC>:call AddComment()<CR>
inoremap <leader>cc <ESC>:call CleanComment()<CR>
nnoremap <leader>ac :call AddComment()<CR>
nnoremap <leader>cc :call CleanComment()<CR>
"}}}

" ========= 代码缩写 ========= {{{
" augroup snippet
"     autocmd!
"     "在末尾加分号
"     autocmd FileType c,cpp,javascript noremap <buffer> <localleader>; A;<esc>o
"     "自动扩展if
"     autocmd FileType javascript,c,cpp :iabbrev <buffer> iff if () <left><left>
"     autocmd FileType python           :iabbrev <buffer> iff if:<left>
"     " 自动扩展for
"     autocmd filetype c,cpp :iabbrev <buffer> forr for () <left><left>
" augroup end
"}}}

" ======== 自动插入文件头 ======= {{{
autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"

function! AutoSetFileHead()
    if &filetype == 'sh'
        call setline(1, "\#!/bin/env bash")
    endif
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python3")
    endif

    normal G
    normal o
    normal o
endfunc
"}}}

" ======== CleverTab ======= {{{
" 如果当前行只有空白，就插入 <Tab>，不然就或继续 CTRL-N 补全操作: >
"function! CleverTab()
"   if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
"      return "\<Tab>"
"   else
"      return "\<C-N>"
"   endif
"endfunction
"inoremap <Tab> <C-R>=CleverTab()<CR>
"}}}
