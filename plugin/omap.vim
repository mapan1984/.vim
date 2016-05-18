" ===== Movement映射operator-movement)=====
" d( = di(
onoremap ( i(
onoremap { i{
onoremap < i<
onoremap " i"
onoremap ' i'
onoremap ` i`

" 删除到下一个return
onoremap r /return<cr>

" 删除下一个括号的内容
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap in[ :<c-u>normal! f[vi(<cr>
