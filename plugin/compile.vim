" <f5> 保存、编译、运行
inoremap <f5> <ESC>:call compile#CompileRunCode()<CR>
nnoremap <f5> :call compile#CompileRunCode()<CR>

" <f6> Build
inoremap <f6> <ESC>:call compile#Build()<CR>
nnoremap <f6> :call compile#Build()<CR>

" <f7> Async Run
inoremap <f7> <ESC>:call compile#Run()<CR>
nnoremap <f7> :call compile#Run()<CR>

" mk mc
" map <leader>mk :call compile#DoMake()<CR>
" map <leader>mc :silent make clean<CR>
