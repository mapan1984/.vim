function! s:Marks()
    marks abcdefghijklmnopqrstuvwxyz.
    echo 'Jump to mark: '
    let marks = nr2char(getchar())
    redraw
    execute 'normal! `' . marks
endfunction

command! Marks call s:Marks()

function! s:Ls()
    ls
    echo 'Jump to buffer: '
    let buf = nr2char(getchar())
    redraw
    execute 'buffer ' . buf
endfunction

command! Ls call s:Ls()
