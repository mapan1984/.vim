setlocal list
setlocal colorcolumn=81              " 彩色显示第81列

" 从头定位for, if 
nnoremap <buffer> df :execute "normal! gg" . '/\vfor .+ in .+:$' . "\r"<cr>
nnoremap <buffer> di :execute "normal! gg" . '/\vif .+:$' . "\r"<cr>
