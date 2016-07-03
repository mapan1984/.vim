setlocal list
setlocal colorcolumn=85              " 彩色显示第85行

" 从头定位for, if 
nnoremap <buffer> df :execute "normal! gg" . '/\vfor .+ in .+:$' . "\r"<cr>
nnoremap <buffer> di :execute "normal! gg" . '/\vif .+:$' . "\r"<cr>

