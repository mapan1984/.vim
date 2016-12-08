setlocal list

" 从头定位for, if 
nnoremap <buffer> df :execute "normal! gg" . '/\vfor .+ in .+:$' . "\r"<cr>
nnoremap <buffer> di :execute "normal! gg" . '/\vif .+:$' . "\r"<cr>

" 将当前光标下的词变为大写
inoremap <c-u> <esc>viwUea
nnoremap <c-u> viwUe


" indent folding
:source ~/.vim/.draft/folding.vim

" 超出80行高亮显示
"func! FindOverLength()
"    highlight OverLength term=reverse cterm=reverse ctermfg=124 gui=reverse guifg=#af0000
"    match OverLength /\%81v.\+/
"endfunc

"syntax match OverLength "\v^.{80,}$"
"highlight link OverLength ErrorMsg
