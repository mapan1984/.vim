if exists("b:my_current_syntax")
  finish
endif

syntax keyword PythonKeyword const

" 超出80行标记为错误信息
syntax match OverLength "\v^.{80,}$"
" syntax match OverLength /\%v81v.\+/


highlight default link OverLength Comment
highlight default link PythonKeyword Keyword

let b:my_current_syntax = "python"
