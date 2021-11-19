" 根据缩进进行折叠
LoadScript .utils/indent-fold.vim

" 帮助文档
nnoremap <buffer> K :<c-u>! pydoc3 <cword><cr>
