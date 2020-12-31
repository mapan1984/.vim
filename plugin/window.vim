" 拆分窗口
nnoremap <c-\> :Vexplore!<cr>
nnoremap <localleader>- :split <c-r>=expand("%:p:h")<cr>/
nnoremap <localleader>\ :vsplit <c-r>=expand("%:p:h")<cr>/
nnoremap <localleader>c <c-w>c
nnoremap <localleader>w <c-w>w

" 窗口移动
nnoremap <localleader>j <c-w>j
nnoremap <localleader>h <c-w>h
nnoremap <localleader>k <c-w>k
nnoremap <localleader>l <c-w>l

nnoremap <localleader>J 5<c-w>-
nnoremap <localleader>H 5<c-w><
nnoremap <localleader>K 5<c-w>+
nnoremap <localleader>L 5<c-w>>
