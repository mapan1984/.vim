" ===== 切换Colum ===== {{{
nnoremap <leader>c :call toggle#FoldColumToggle()<cr>
"}}}

" ===== 切换Quickfix ===== {{{
nnoremap <leader>q :call toggle#QuickfixToggle()<cr>
"}}}

" ===== 代码折叠 =====  {{{
nnoremap <leader>z :call toggle#FoldToggle()<cr>
"}}}

" ===== 切换wrap =====
nnoremap <leader>wr :setlocal wrap! wrap?<cr>

" ===== 语法开关，关闭语法可以加快大文件的展示 =====
nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>
