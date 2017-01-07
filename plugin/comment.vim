"inoremap <c-/> <esc> :call Comment()<cr>
"nnoremap <c-/> :call Comment()<CR>
inoremap  <esc> :call comment#Comment()<cr>
nnoremap  :call comment#Comment()<cr>
vnoremap  :<c-u>call comment#MultiLineComment()<cr>
