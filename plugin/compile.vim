" ========= 编译 && 运行 =========
"简单编译
"nmap <leader>p :!python %<CR>
" 编译并运行
func! Compile_Run_Code()
    exec "w"
    if &filetype == "c"
        exec "!gcc -Wall -std=c11 -o %:r %:t"
        exec "!time ./%:r"
    elseif &filetype == "cpp"
        exec "!g++ -Wall -std=c++14 -o %:r %:t"
        exec "!time ./%:r"
    elseif &filetype == "scheme"
        exec "!guile -l %:t"
    elseif &filetype == "python"
        exec "!python3 %:t"
    elseif &filetype == "sh"
        exec "!bash %:t"
    endif
endfunc

" rr 保存、编译、运行
inoremap <leader>rr <ESC>:call Compile_Run_Code()<CR>
vnoremap <leader>rr <ESC>:call Compile_Run_Code()<CR>
nnoremap <leader>rr :call Compile_Run_Code()<CR>
