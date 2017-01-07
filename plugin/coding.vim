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
" autocmd BufNewFile *.sh,*.py exec ":call format#AutoSetFileHead()"
nnoremap <localleader>hd :call format#AutoSetFileHead()<CR>
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

" Use <tab> and <shift-tab> to indent {{{
vmap <tab> >gv
vmap <s-tab> <gv
"}}}
