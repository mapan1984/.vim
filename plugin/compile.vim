" ========= 编译 && 运行 =========
"简单编译
"nmap <leader>p :!python %<CR>
" 编译并运行
func! Compile_Run_Code()
    exec "w"
    " 如果不在当前目录，改变路径
    if expand("%:p:h")!=getcwd()
        execute "normal! :cd %:p:h\<cr>:pwd\<cr>"
    endif
    " 对c文件使用make，出错后可以在quickfix窗口中查看
    if &filetype == "c"
        set makeprg=gcc\ -Wall\ -std=c11\ -o\ %:r\ %:t
        execute "silent make"
        execute "!time ./%:r"
    elseif &filetype == "cpp"
        set makeprg=g++\ -Wall\ -std=c++14\ -o\ %:r\ %:t"
        execute "silent make"
        execute "!time ./%:r"
    elseif &filetype == "scheme"
        exec "!guile -l %:t"
    elseif &filetype == "python"
        exec "!python3 %:t"
    elseif &filetype == "sh"
        exec "!bash %:t"
    endif
    " execute "copen"
    execute "cwindow"
endfunc

" rr 保存、编译、运行
inoremap <leader>rr <ESC>:call Compile_Run_Code()<CR>
vnoremap <leader>rr <ESC>:call Compile_Run_Code()<CR>
nnoremap <leader>rr :call Compile_Run_Code()<CR>


"进行make的设置
function Do_make()
    set makeprg=make
    execute "silent make"
    execute "copen"
endfunction
map <F6> :call Do_make()<CR>
map <c-F6> :silent make clean<CR>

