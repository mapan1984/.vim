" 在终端<ctrl-/>被映射为<ctrl-_>
inoremap <c-_> <esc> :call comment#Comment()<cr>
inoremap <c-/> <esc> :call comment#Comment()<cr>
nnoremap <c-_> :call comment#Comment()<cr>
nnoremap <c-/> :call comment#Comment()<cr>
vnoremap <c-_> :<c-u>call comment#MultiLineComment()<cr>
vnoremap <c-/> :<c-u>call comment#MultiLineComment()<cr>
