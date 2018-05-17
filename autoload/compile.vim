" ========= 编译 && 运行 ========= {{{
function! compile#CompileRunCode()
    " 执行保存
    execute "w"
    " 如果不在当前目录，改变路径
    if expand("%:p:h") != getcwd()
        execute "normal! :cd %:p:h\<cr>:pwd\<cr>"
    endif
    " 对c, cpp文件使用make，出错后可以在quickfix窗口中查看
    if &filetype == "c"
        set makeprg=gcc\ -Wall\ -std=c11\ -o\ %:r\ %:t
        execute "silent make"
        execute "!time ./%:r"
    elseif &filetype == "cpp"
        set makeprg=g++\ -Wall\ -std=c++14\ -o\ %:r\ %:t
        execute "silent make"
        execute "!time ./%:r"
    elseif &filetype == "go"
        execute "!go run %:t"
    elseif &filetype == "scheme"
        execute "!guile -l %:t"
    elseif &filetype == "python"
        execute "!./%:t"
    elseif &filetype == "sh"
        execute "!./%:t"
    endif
    " 只有出错信息时，打开quickfix窗口
    execute "cwindow"
endfunction
"}}}


" ========= 构建 ========= {{{
function! compile#Build()
    let l:rootdir = getcwd()
    let l:makefile = l:rootdir.'/Makefile'
    execute "w"
    if &filetype == "c"
        if filereadable(l:makefile)
            execute "AsyncRun -save=2 -cwd=<root> make"
        else
            execute "AsyncRun gcc -Wall -std=c11 -o %:r %:t"
        endif
    elseif &filetype == "cpp"
        if filereadable(l:makefile)
            execute "AsyncRun -save=2 -cwd=<root> make"
        else
            execute "AsyncRun! g++ -Wall -std=c++14 -o %:r %:t"
        endif
    elseif &filetype == "go"
        " current file dir
        execute "AsyncRun -save=2 go build ./"
    endif
endfunction
"}}}


" ========= 运行 ========= {{{
function! compile#Run()
    let l:rootdir = getcwd()
    let l:makefile = l:rootdir.'/Makefile'
    execute "w"
    if &filetype == "c"
        if filereadable(l:makefile)
            " 目录名
            execute "AsyncRun -raw -cwd=<root> time ./%:t:r"
        else
            " 文件名
            execute "AsyncRun! gcc -Wall -std=c11 -o %:r %:t; time ./%:r"
        endif
    elseif &filetype == "cpp"
        if filereadable(l:makefile)
            execute "AsyncRun -raw -cwd=<root> time ./%:t:r"
        else
            execute "AsyncRun! g++ -Wall -std=c++14 -o %:r %:t; time ./%:r"
        endif
    elseif &filetype == "go"
        execute "AsyncRun -raw go run %:t"
    elseif &filetype == "scheme"
        execute "AsyncRun -raw guile -l %:t"
    elseif &filetype == "python"
        execute "AsyncRun -raw ./%:t"
    elseif &filetype == "sh"
        execute "AsyncRun -raw ./%:t"
    endif
endfunction
"}}}


" ========= 进行make的设置 ========= {{{
function compile#DoMake()
    " 保存文件
    execute "w"
    " 如果不在当前目录，改变路径
    if expand("%:p:h") != getcwd()
        execute "normal! :cd %:p:h\<cr>:pwd\<cr>"
    endif
    set makeprg=make
    execute "silent !make"
    execute "!time ./%:r"
    execute "cwindow"
    execute "redraw!"
endfunction
"}}}
