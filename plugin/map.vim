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
inoremap <c-q> <esc>:q<cr>

" 切换buffer
nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>

" Switch CWD to the directory of the open buffer:
noremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" 编辑,重载.vimrc
"nnoremap <silent> <leader>ev :vsplit $MYVIMRC<CR>
"nnoremap <silent> <leader>sv :source $MYVIMRC<CR>
"}}}

" ===== Brackets ===== {{{
" ( = i(
onoremap ( i(
onoremap { i{
onoremap [ i[
onoremap < i<
onoremap " i"
onoremap ' i'
onoremap ` i`

" 下一个括号的内容
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap in[ :<c-u>normal! f[vi(<cr>
onoremap in< :<c-u>normal! f<vi<<cr>
onoremap in" :<c-u>normal! f"vi"<cr>
onoremap in' :<c-u>normal! f'vi'<cr>
onoremap in` :<c-u>normal! f`vi`<cr>
"}}}

" 将当前光标下的词变为大写
" inoremap <A-u> <esc>viwUea
inoremap u <esc>viwUea
nnoremap u viwUe

" Format Jump
nnoremap <silent> g; g;zz
nnoremap <silent> g, g,zz

" ===== 插入模式下移动 ===== {{{
inoremap <c-a> <home>
inoremap <c-e> <end>
inoremap <c-k> <up>
inoremap <c-j> <down>
inoremap <c-f> <right>
inoremap <c-b> <left>
"inoremap <A-f> <c-o>w
"inoremap <A-b> <c-o>b
"inoremap <M-f> <c-o>w
"inoremap <M-b> <c-o>b
inoremap f <c-o>w
inoremap b <c-o>b
"}}}

" ===== 插入模式下删除 ===== {{{
inoremap <c-u> <c-o>d0
inoremap <c-k> <c-o>C
inoremap <c-d> <c-o>x
inoremap <c-h> <bs>
inoremap <c-w> <esc>bdwi
"}}}

" ===== 命令模式下移动 ===== {{{
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-f> <right>
cnoremap <c-b> <left>
"}}}

" ===== 使用用系统剪切板 ===== {{{
nnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>y "+y
vnoremap <leader>p "+p
"}}}
