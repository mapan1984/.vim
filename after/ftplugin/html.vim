setlocal wrap                 " 开启折行显示
setlocal colorcolumn=0        " 消除.vimrc中的默认彩色显示第81列

" Maximum width of text that is being inserted.  A longer line will be
" broken after white space to get this width.  A zero value disables this.
setlocal textwidth=0

setlocal iskeyword+=%,&,-          " 将 - 连接符也视为 word 的一部分

" 创建折叠操作符 <vasual>zf
setlocal foldmethod=marker
nnoremap <buffer> <localleader>f Vatzf

" bracket, 其他情况查看`../plugin/bracket.vim`
"inoremap <buffer> < <><left>
"inoremap <buffer> > <ESC>:call RemoveNextDoubleChar('>')<CR>a

" 根据缩进折叠
LoadScript .utils/indent-fold.vim
