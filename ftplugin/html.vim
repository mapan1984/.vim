setlocal wrap
set colorcolumn=0              " 消除.vimrc中的默认彩色显示

" 创建折叠操作符 <vasual>zf 
setlocal foldmethod=marker
nnoremap <buffer> <localleader>f Vatzf

" ======== 自动插入html模板 =======
nnoremap <buffer> <localleader>it :call AutoInsertTemplate()

function! AutoInsertTemplate()
    call setline(1, "\<!DOCTYPE HTML>")
    call append(1, "\<html lang=\"en-US\">")
    call append(2, "\<head>")
    call append(3, "\  <meta charset=\"UTF-8\">")
    call append(4, "\  <title></title>")
    call append(5, "\</head>")
    call append(6, "\<body>")
    call append(7, "\</body>")
    call append(8, "\</html>")
endfunc

" css. js 链接
iabbrev <buffer> linkcss <link rel="stylesheet" type="text/css" href="style.css" media="all">
iabbrev <buffer> scriptsrc <script type="text/javascript" src=""></script>

" 特殊符号
iabbrev <buffer> <e &ldquo;
iabbrev <buffer> >e &rdquo;
iabbrev <buffer> spe &nbsp;
