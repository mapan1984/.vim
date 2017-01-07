echom "Autoloading..."
" ========= 编译 && 运行 ========= {{{
function! compile#CompileRunCode()
    " 执行保存
    execute "w"
    " 如果不在当前目录，改变路径
    if expand("%:p:h")!=getcwd()
        execute "normal! :cd %:p:h\<cr>:pwd\<cr>"
    endif
    " 对c, cpp文件使用make，出错后可以在quickfix窗口中查看
    if &filetype == "c"
        set makeprg=gcc\ -Wall\ -std=c11\ -o\ %:r\ %:t
        execute "silent make"
        execute "!time ./%:r"
    elseif &filetype == "cpp"
        set makeprg=g++\ -Wall\ -std=c++14\ -o\ %:r\ %:t"
        execute "silent make"
        execute "!time ./%:r"
    elseif &filetype == "scheme"
        execute "!guile -l %:t"
    elseif &filetype == "python"
        execute "!python3 %:t"
    elseif &filetype == "sh"
        execute "!bash %:t"
    endif
    " 只有出错信息时，打开quickfix窗口
    execute "cwindow"
endfunction
"}}}

" ========= 进行make的设置 ========= {{{
function compile#DoMake()
    " 保存文件
    execute "w"
    " 如果不在当前目录，改变路径
    if expand("%:p:h")!=getcwd()
        execute "normal! :cd %:p:h\<cr>:pwd\<cr>"
    endif
    set makeprg=make
    execute "silent make"
    execute "!time ./%:r"
    execute "cwindow"
endfunction
"}}}
