setlocal wrap
setlocal colorcolumn=0                    " 消除.vimrc中的默认彩色显示第81列

" 创建折叠操作符 <vasual>zf 
setlocal foldmethod=marker
nnoremap <buffer> <localleader>f Vatzf

" indent folding
:source ~/.vim/.draft/folding.vim

" ======== 自动插入html模板 ======= {{{
nnoremap <buffer> !<tab> :call format#AutoInsertTemplate()<cr>
"}}}

" css. js 链接
iabbrev <buffer> linkcss
                 \ <link rel="stylesheet" type="text/css" href="style.css" media="all">
iabbrev <buffer> linkjs
                 \ <script type="text/javascript" src=""></script>

" 特殊符号
iabbrev <buffer> sp &ensp;
iabbrev <buffer> 2sp &emsp;
iabbrev <buffer> < &lt;
iabbrev <buffer> > &gt;
iabbrev <buffer> <= &le;
iabbrev <buffer> >= &ge;
