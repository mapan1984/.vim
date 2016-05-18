" ===== Window =====
nnoremap <leader>ve :Vexplore<cr>
nnoremap <leader>ws :split
nnoremap <leader>wv :vsplit
nnoremap <leader>wc <c-w>c
nnoremap <leader>ww <c-w>w
noremap wj <c-w>j
noremap wh <c-w>h
noremap wk <c-w>k
noremap wl <c-w>l

" ===== Tab page =====
nnoremap <leader>tx :Texplore<cr>
" Opens a new tab with the current buffer's path
noremap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
noremap <leader>tn :tabnew<cr>
noremap <leader>tc :tabclose<cr>
noremap <leader>to :tabonly<cr>
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
