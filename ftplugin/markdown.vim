" wrap at a character in the breakat option
setlocal wrap linebreak

" ===== Indentation =====
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4

" 在markdown中定位到' ^==+$\r '，使用cih(change inside heading)
onoremap <buffer> ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
" cah(change around heading)
onoremap <buffer> ah :<c-u>execute "normal! ?^==\\+\r:nohlsearch\rg_vk0"<cr>

" 对``的操作(代码) {{{
inoremap <buffer> `p ``<esc>i
" ` = i`
onoremap <buffer> ` i`
" 对下一个``
onoremap <buffer> in` :<c-u>normal! f`vi`<cr>
"}}}

" 为单词加<kbd>标签
nnoremap <buffer> <leader>` viw<esc>a</kbd><esc>6hbi<kbd><esc>lelel

" 缩写
iabbrev <buffer> @@ mapan1984@outlook.com
iabbrev <buffer> link []()<esc>2hi
iabbrev <buffer> kbd <kbd></kbd><esc>b2hi
