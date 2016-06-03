setlocal wrap
set colorcolumn=0              " 消除.vimrc中的默认彩色显示

" 创建折叠操作符 <vasual>zf 
setlocal foldmethod=marker
nnoremap <buffer> <localleader>f Vatzf

iabbrev <buffer> <e &ldquo;
iabbrev <buffer> >e &rdquo;
iabbrev <buffer> spe &nbsp;
