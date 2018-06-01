" 缩进
setlocal nosmartindent
setlocal cindent
" 根据缩进进行折叠
:source ~/.vim/.utils/indent-fold.vim

" 帮助文档
nnoremap <buffer> K :<c-u>AsyncRun! pydoc3 <cword><cr>

" 超出80行高亮显示
"func! FindOverLength()
"    highlight OverLength term=reverse cterm=reverse ctermfg=124 gui=reverse guifg=#af0000
"    match OverLength /\%81v.\+/
"endfunc

"syntax match OverLength "\v^.{80,}$"
"highlight link OverLength ErrorMsg

"highlight OverLength ctermbg=red
"call matchadd('OverLength', '\%81v', 100)
