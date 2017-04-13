" 拆分窗口
nnoremap <c-\> :Vexplore!<cr>
nnoremap <localleader>- :split <c-r>=expand("%:p:h")<cr>/
nnoremap <localleader>\ :vsplit <c-r>=expand("%:p:h")<cr>/
nnoremap <localleader>c <c-w>c
nnoremap <localleader>w <c-w>w

" 窗口移动
noremap <localleader>j <c-w>j
noremap <localleader>h <c-w>h
noremap <localleader>k <c-w>k
noremap <localleader>l <c-w>l
