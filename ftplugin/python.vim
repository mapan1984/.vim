" 缩进
setlocal nosmartindent
setlocal cindent

iabbrev <buffer> form from

" 根据缩进进行折叠
:source ~/.vim/.draft/folding.vim

" 超出80行高亮显示
"func! FindOverLength()
"    highlight OverLength term=reverse cterm=reverse ctermfg=124 gui=reverse guifg=#af0000
"    match OverLength /\%81v.\+/
"endfunc

"syntax match OverLength "\v^.{80,}$"
"highlight link OverLength ErrorMsg
