" ===== buffer =====
" 切换buffer
nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>

" ===== Window =====
nnoremap <leader>wx :Vexplore!<cr>
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
noremap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
noremap <leader>tn :tabnew<cr>
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
" normal模式下切换到确切的tab
noremap <silent>t1 :tabn 1<cr>
noremap <silent>t2 :tabn 2<cr>
noremap <silent>t3 :tabn 3<cr>
noremap <silent>t4 :tabn 4<cr>
noremap <silent>t5 :tabn 5<cr>
noremap <silent>t6 :tabn 6<cr>
noremap <silent>t7 :tabn 7<cr>
noremap <silent>t8 :tabn 8<cr>
noremap <silent>t9 :tabn 9<cr>
noremap <silent>t0 :tabn 10<cr>
