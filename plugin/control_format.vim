" ========= 格式控制 ==========
func! RemoveTabs()
    if &shiftwidth ==# 2
        execute '%s/\t/  /g'
    elseif &shiftwidth ==# 4
        execute '%s/\t/    /g'
    else
        execute '%s/\t/ /g'
    endif
endfunc

" rt 将tab替换为空格
inoremap <leader>rt <esc>:call RemoveTabs()<cr>
vnoremap <leader>rt <esc>:call RemoveTabs()<cr>
nnoremap <leader>rt :call RemoveTabs()<cr>

" rb 去除所有尾部空白
inoremap <leader>rb <ESC>:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
vnoremap <leader>rb <ESC>:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
nnoremap <leader>rb :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" rl 去空行
nnoremap <leader>rl :g/^\s*$/d<CR>

" ======== 自动插入文件头 =======
autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
    if &filetype == 'sh'
        call setline(1, "\#!/bin/env bash")
    endif
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python3")
        call append(1, "\# encoding: utf-8")
    endif

    normal G
    normal o
    normal o
endfunc
