" 设置leader键
let mapleader=","
let maplocalleader="\<Space>"

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

" 使用tab键来代替%进行匹配跳转
nnoremap <tab> %
vnoremap <tab> %

" ===== Brackets ===== {{{
" auto complete
inoremap (p ()<ESC>i
inoremap [p []<ESC>i
inoremap {p {}<ESC>i
inoremap {<cr> {<cr>}<esc>O
inoremap <p <><esc>i
inoremap 'p ''<esc>i
inoremap "p ""<esc>i
inoremap (P ()<ESC>i
inoremap [P []<ESC>i
inoremap {P {}<ESC>i
inoremap <P <><esc>i
inoremap "P ""<esc>i

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
"}}}


" ===== 插入模式下删除 ===== {{{
inoremap <c-u> <c-o>d0
inoremap <c-k> <c-o>C
inoremap <c-d> <c-o>x
inoremap <c-h> <c-o>X
inoremap <c-w> <esc>bdwi
"}}}

" ===== 使用用系统剪切板 ===== {{{
nnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>y "+y
vnoremap <leader>p "+p
"}}}

" Switch CWD to the directory of the open buffer:
noremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" 编辑,重载.vimrc
"nnoremap <silent> <leader>ev :vsplit $MYVIMRC<CR>
"nnoremap <silent> <leader>sv :source $MYVIMRC<CR>
