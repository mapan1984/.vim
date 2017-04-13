setlocal wrap                 " 开启折叠
setlocal colorcolumn=0        " 消除.vimrc中的默认彩色显示第81列

" 跳到下一个标题
nnoremap <buffer> <localleader>nh /^##\+<cr>:nohlsearch<cr>
" 跳到下一个代码块
nnoremap <buffer> <localleader>nc /^``` [a-z]\+<cr>:nohlsearch<cr>

" 对``的操作(代码)
inoremap <buffer> `p ``<left>
onoremap <buffer> ` i`
onoremap <buffer> in` :<c-u>normal! f`vi`<cr>

" 为单词加<kbd>标签
nnoremap <buffer> <leader>` viw<esc>a</kbd><esc>6hbi<kbd><esc>lelel

" 代码块
iabbrev <buffer> ``` ```<cr>```<up>

" Plugin vim-markdown
setlocal conceallevel=2
noremap <buffer> <silent> to :Toc<cr>
