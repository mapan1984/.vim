" ===== other ===== {{{
inoremap jk <ESC>

" Treat long lines as break lines (useful when moving around in them)
noremap j gj
noremap k gk

" jump the middle postion
inoremap zz <c-o>zz

" first you need add 'stty -ixon' to .bashrc to forbid <c-s> suspend stty
nnoremap <c-s> :w<CR>
inoremap <c-s> <esc>:w<cr>i

" first you need add 'stty -ixon' to .bashrc to forbid <c-q> regain stty
nnoremap <c-q> :q<CR>
inoremap <c-q> <esc>:q<cr>i

" 切换buffer
nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>

" Switch CWD to the directory of the open buffer:
noremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" 查找单词
nnoremap <F2> :call ci#GetCi()<CR>

" 编辑,重载.vimrc
"nnoremap <silent> <leader>ev :vsplit $MYVIMRC<CR>
"nnoremap <silent> <leader>sv :source $MYVIMRC<CR>
"}}}

" ===== Brackets ===== {{{
" auto complete
inoremap (p ()<left>
inoremap [p []<left>
inoremap {p {}<left>
inoremap {<cr> {<cr>}<esc>O
inoremap <p <><left>
inoremap 'p ''<left>
inoremap "p ""<left>
inoremap (P ()<left>
inoremap [P []<left>
inoremap {P {}<left>
inoremap <P <><left>
inoremap "P ""<left>

" ( = i(
onoremap ( i(
onoremap { i{
onoremap [ i[
onoremap < i<
onoremap " i"
onoremap ' i'

" 下一个括号的内容
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap in[ :<c-u>normal! f[vi(<cr>
onoremap in< :<c-u>normal! f<vi<<cr>
onoremap in" :<c-u>normal! f"vi"<cr>
onoremap in' :<c-u>normal! f'vi'<cr>
"}}}

" ===== 插入模式下移动 ===== {{{
inoremap <c-a> <home>
inoremap <c-e> <end>
"inoremap <c-k> <up>
"inoremap <c-j> <down>
inoremap <c-f> <right>
inoremap <c-b> <left>
"inoremap <M-f> <c-o>w
"inoremap <M-b> <c-o>b
"inoremap <A-f> <c-o>w
"inoremap <A-b> <c-o>b
inoremap b <c-o>b
inoremap f <c-o>w
"}}}

" ===== 插入模式下删除 ===== {{{
inoremap <c-u> <c-o>d0
inoremap <c-k> <c-o>C
inoremap <c-d> <c-o>x
inoremap <c-h> <c-o>X
inoremap <c-w> <esc>bdwi
"}}}

" ===== 命令模式下移动 ===== {{{
cnoremap <c-a> <home>
cnoremap <c-e> <end>
"cnoremap <c-k> <up>
"cnoremap <c-j> <down>
cnoremap <c-f> <right>
cnoremap <c-b> <left>
"cnoremap <M-f> <c-o>w
"cnoremap <M-b> <c-o>b
"}}}

" ===== 使用用系统剪切板 ===== {{{
nnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>y "+y
vnoremap <leader>p "+p
"}}}
