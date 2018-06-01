setlocal wrap                 " 开启折叠
setlocal colorcolumn=0        " 消除.vimrc中的默认彩色显示第81列

" 跳到下一个标题
nnoremap <buffer> <localleader>nh /^##\+<cr>:nohlsearch<cr>
" 跳到下一个代码块
nnoremap <buffer> <localleader>nc /^``` [a-z]\+<cr>:nohlsearch<cr>

" 为单词加<kbd>标签
nnoremap <buffer> <leader>` viw<esc>a</kbd><esc>6hbi<kbd><esc>lelel

" 代码块
" iabbrev <buffer> ``` ```<cr>```<up>

" 行内公式
iabbrev <buffer> \$ \\(\\)<left><left><left><space><left>

" Plugin vim-markdown
setlocal conceallevel=2
noremap <buffer> <silent> to :Toc<cr>
