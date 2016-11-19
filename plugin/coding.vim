" ========= 加注释 取消注释 ========= {{{
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
        let l:commentLen = len(s:comment[&ft])
        exec "normal! ^" . repeat("x", l:commentLen+1)
    else
        " 否则增加注释
        exec "normal! I" . s:comment[&ft] ." "
    endif
    call winrestview(l:winview)
endfunction

"inoremap <c-/> <esc> :call Comment()<cr>
"nnoremap <c-/> :call Comment()<CR>
inoremap  <esc> :call Comment()<cr>
nnoremap  :call Comment()<cr>
"}}}

" ========= 代码缩写 ========= {{{
" augroup snippet
"     autocmd!
"     "在末尾加分号
"     autocmd filetype c,cpp,javascript noremap <buffer> <localleader>; a;<esc>o
"     "自动扩展if
"     autocmd filetype javascript,c,cpp :iabbrev <buffer> iff if () <left><left>
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
"
" use <tab> and <shift-tab> to indent {{{
vmap <tab> >gv
vmap <s-tab> <gv
"}}}
