" ========= 编译 && 运行 ========= {{{
" <f5> 保存、编译、运行
inoremap <f5> <ESC>:call compile#CompileRunCode()<CR>
nnoremap <f5> :call compile#CompileRunCode()<CR>
"}}}

" ========= 进行make的设置 ========= {{{
" mk mc
map <leader>mk :call compile#DoMake()<CR>
map <leader>mc :silent make clean<CR>
"}}}
