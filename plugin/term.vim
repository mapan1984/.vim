" vim 8.1 以下不支持
if v:version < 800
    finish
endif

"noremap <f3> :belowright term python<cr>
tnoremap <m-q> <c-\><c-n>

noremap <m-H> <c-w>h
noremap <m-L> <c-w>l
noremap <m-J> <c-w>j
noremap <m-K> <c-w>k
inoremap <m-H> <esc><c-w>h
inoremap <m-L> <esc><c-w>l
inoremap <m-J> <esc><c-w>j
inoremap <m-K> <esc><c-w>k

if has('terminal') && exists(':terminal') == 2
    " vim 8.1 支持 termwinkey ，不需要把 terminal 切换成 normal 模式
    tnoremap <m-H> <c-w>h
    tnoremap <m-L> <c-w>l
    tnoremap <m-J> <c-w>j
    tnoremap <m-K> <c-w>k
elseif has('nvim')
    " neovim 没有 termwinkey 支持，必须把 terminal 切换回 normal 模式
    tnoremap <m-H> <c-\><c-n><c-w>h
    tnoremap <m-L> <c-\><c-n><c-w>l
    tnoremap <m-J> <c-\><c-n><c-w>j
    tnoremap <m-K> <c-\><c-n><c-w>k
endif
