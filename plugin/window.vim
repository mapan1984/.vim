" 拆分窗口
nnoremap <c-\> :Vexplore!<cr>
nnoremap ws :split <c-r>=expand("%:p:h")<cr>/
nnoremap wv :vsplit <c-r>=expand("%:p:h")<cr>/
nnoremap wc <c-w>c
nnoremap ww <c-w>w

" 窗口移动
noremap wj <c-w>j
noremap wh <c-w>h
noremap wk <c-w>k
noremap wl <c-w>l
