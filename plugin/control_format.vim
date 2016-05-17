" ========= 格式控制 ==================== {{{
" rt 将tab替换为空格
inoremap <leader>rt <ESC>:%s/\t/    /g<CR>
vnoremap <leader>rt <ESC>:%s/\t/    /g<CR>
nnoremap <leader>rt :%s/\t/    /g<CR>

" rb 去除所有尾部空白
inoremap <leader>rb <ESC>:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
vnoremap <leader>rb <ESC>:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
nnoremap <leader>rb :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" rl 去空行
nnoremap <leader>rl :g/^\s*$/d<CR>
"}}}
