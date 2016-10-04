" ========= rt 将tab替换为空格 ========== {{{
inoremap <leader>rt <esc>:call RemoveTabs()<cr>
vnoremap <leader>rt <esc>:call RemoveTabs()<cr>
nnoremap <leader>rt :call RemoveTabs()<cr>

func! RemoveTabs()
    if &shiftwidth ==# 2
        execute '%s/\t/  /g'
    elseif &shiftwidth ==# 4
        execute '%s/\t/    /g'
    else
        execute '%s/\t/ /g'
    endif
endfunc
"}}}

" rb 去除所有尾部空白 {{{
inoremap <leader>ds <ESC>:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
vnoremap <leader>ds <ESC>:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
nnoremap <leader>ds :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
"}}}

" rl 去空行
nnoremap <leader>dl :g/^\s*$/d<CR>
