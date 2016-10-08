setlocal list

" 从头定位for, if 
nnoremap <buffer> df :execute "normal! gg" . '/\vfor .+ in .+:$' . "\r"<cr>
nnoremap <buffer> di :execute "normal! gg" . '/\vif .+:$' . "\r"<cr>

" 将当前光标下的词变为大写
inoremap <c-u> <esc>viwUea
nnoremap <c-u> viwUe

" indent folding
:source ~/.vim/mydraft/folding.vim"
