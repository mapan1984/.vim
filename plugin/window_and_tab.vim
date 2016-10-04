" ===== buffer =====
" 切换buffer
nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>

" ===== Window =====
" 拆分窗口
nnoremap <c-\> :Vexplore!<cr>
nnoremap <leader>ws :split <c-r>=expand("%:p:h")<cr>/
nnoremap <leader>wv :vsplit <c-r>=expand("%:p:h")<cr>/
nnoremap <leader>wc <c-w>c
nnoremap <leader>ww <c-w>w
noremap wj <c-w>j
noremap wh <c-w>h
noremap wk <c-w>k
noremap wl <c-w>l

" ===== Tab page =====
nnoremap <leader>tx :Texplore<cr>
" open file in new tab
noremap <c-o> :tabedit <c-r>=expand("%:p:h")<cr>/
" create new file in new tab
noremap <c-n> :tabnew<cr>
noremap <leader>tc :tabclose<cr>
" 关闭所有其它的标签页
noremap <leader>to :tabonly<cr>
" 当前标签页成为最后一个
noremap <leader>tm :tabmove<cr>
" tab切换
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tj :tabnext<cr>
map <leader>tk :tabprev<cr>
"" normal模式下切换到确切的tab
noremap <tab>1 :tabn 1<cr>
noremap <tab>2 :tabn 2<cr>
noremap <tab>3 :tabn 3<cr>
noremap <tab>4 :tabn 4<cr>
noremap <tab>5 :tabn 5<cr>
