func! Fof()
    exec "normal! ifor(let item of object) {}"
endfunc

func! Fin()
    exec "normal! ifor(let item in object) {}"
endfunc

func! Sti()
    exec "setInterval(() => {}, time);"
endfunc

func! Sto()
    exec "setTimeout(() => {}, time);"
endfunc

func! Clg()
    exec "console.log();"
endfunc

" 将命令转换为同名的函数名，比如clg --> Clg
func! OrderToFunc(order)
    return join([toupper(a:order[0]), a:order[1:]], "")
endfunc

" 完成命令与函数的键盘映射
" 如: nnoremap <buffer> clg<tab> :call Clg()<cr>
func! Mapping(...)
    for order in a:000
        echom order
        echom OrderToFunc(order)
    endfor
endfunc

:call Mapping("fof", "fin", "sti", "sto", "clg")
