" ===== buffer =====
" 切换buffer
nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>

" ===== Window =====
" 拆分窗口
nnoremap <c-\> :Vexplore!<cr>
nnoremap ws :split <c-r>=expand("%:p:h")<cr>/
nnoremap wv :vsplit <c-r>=expand("%:p:h")<cr>/
nnoremap wc <c-w>c
nnoremap ww <c-w>w
noremap wj <c-w>j
noremap wh <c-w>h
noremap wk <c-w>k
noremap wl <c-w>l

" ===== Tab page =====
nnoremap <tab>x :Texplore<cr>
" open file in new tab
noremap <c-o> :tabedit <c-r>=expand("%:p:h")<cr>/
" create new file in new tab
noremap <c-n> :tabnew<cr>
" 关闭当前标签页
noremap <tab>c :tabclose<cr>
" 关闭所有其它的标签页
noremap <tab>o :tabonly<cr>
" 当前标签页成为最后一个
noremap <tab>m :tabmove<cr>
" tab切换
noremap <tab>f :tabfirst<cr>
noremap <tab>l :tablast<cr>
noremap <tab>j :tabnext<cr>
noremap <tab>k :tabprev<cr>
noremap <tab>1 :tabn 1<cr>
noremap <tab>2 :tabn 2<cr>
noremap <tab>3 :tabn 3<cr>
noremap <tab>4 :tabn 4<cr>
noremap <tab>5 :tabn 5<cr>
