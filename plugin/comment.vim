" ========= 加注释 取消注释 =========
func! Add_Comment()
    if &filetype ==# "c" || &filetype ==# "cpp" || &filetype ==# "javascript"
        exec "normal! I//" . "\<esc>"
    elseif &filetype ==# "python" || &filetype ==# "sh"
        exec "normal! I#" . "\<esc>"
    elseif &filetype ==# "vim"
        exec "normal! I\" " . "\<esc>"
    elseif &filetype ==# "scheme"
        exec "normal! I;;" . "\<esc>"
    endif
endfunc

func! Clean_Comment()
    if &filetype ==# "c" || &filetype ==# "cpp" || &filetype ==# "javascript"
        exec "normal! ^xx"
    elseif &filetype ==# "python" || &filetype ==# "sh"
        exec "normal! ^x"
    elseif &filetype ==# "vim"
        exec "normal! ^xx"
    elseif &filetype ==# "scheme"
        exec "normal! ^xx"
    endif
endfunc

inoremap <leader>ac <ESC>:call Add_Comment()<CR>
inoremap <leader>cc <ESC>:call Clean_Comment()<CR>
vnoremap <leader>ac <ESC>:call Add_Comment()<CR>
vnoremap <leader>cc <ESC>:call Clean_Comment()<CR>
nnoremap <leader>ac :call Add_Comment()<CR>
nnoremap <leader>cc :call Clean_Comment()<CR>
