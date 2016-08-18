setlocal wrap
set colorcolumn=0              " 消除.vimrc中的默认彩色显示81列

" 在markdown中向前定位' ^==+$ '，使用cih(change inside heading 包括标题标记===)
onoremap <buffer> ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
" cah(change around heading)
onoremap <buffer> ah :<c-u>execute "normal! ?^==\\+\r:nohlsearch\rg_vk0"<cr>

" 跳到下一个标题
nnoremap <buffer> <leader>nh /^##\+<cr>:nohlsearch<cr>
" 跳到下一个代码块
nnoremap <buffer> <leader>nc /^``` [a-z]\+<cr>:nohlsearch<cr>

" 对``的操作(代码) {{{
inoremap <buffer> `p ``<esc>i
onoremap <buffer> ` i`
onoremap <buffer> in` :<c-u>normal! f`vi`<cr>
"}}}

" 为单词加<kbd>标签
nnoremap <buffer> <leader>` viw<esc>a</kbd><esc>6hbi<kbd><esc>lelel

" 缩写 e = expand
iabbrev <buffer> maile <mapan1984@outlook.com>
iabbrev <buffer> linke []()<left><left><left>
iabbrev <buffer> linkte <a target="_blank" href=""></a><esc>Bf"a
iabbrev <buffer> kbde <kbd></kbd><left><left><left><left><left><left>
iabbrev <buffer> ``` ```<cr><cr>```<up><left>
" 空格
iabbrev <buffer> sp &ensp;
iabbrev <buffer> 2sp &emsp;
