setlocal wrap                 " 开启折叠
setlocal colorcolumn=0        " 消除.vimrc中的默认彩色显示第81列

" 创建折叠操作符 <vasual>zf 
setlocal foldmethod=marker
nnoremap <buffer> <localleader>f Vatzf

" bracket, 其他情况查看`../plugin/bracket.vim`
inoremap <buffer> < <><left>
inoremap <buffer> > <ESC>:call RemoveNextDoubleChar('>')<CR>a

" 根据缩进折叠
:source ~/.vim/.draft/folding.vim

" 自动插入html模板
nnoremap <buffer> !<tab> :call format#AutoInsertTemplate()<cr>

