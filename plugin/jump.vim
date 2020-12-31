function! s:Marks()
    marks abcdefghijklmnopqrstuvwxyz.
    " echo 'Jump to mark: '
    " let marks = nr2char(getchar())
    let l:marks = input("Jump to mark: ")
    " redraw
    execute 'normal! `' . l:marks
endfunction

command! Marks call s:Marks()

function! s:Ls()
    ls
    " echo 'Jump to buffer: '
    " let buf = nr2char(getchar())
    let l:buf = input("Jump to buffer: ")
    " redraw
    execute 'buffer ' . l:buf
endfunction

command! Ls call s:Ls()
