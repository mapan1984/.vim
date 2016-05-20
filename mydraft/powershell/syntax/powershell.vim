if exists("b:current_syntax")
    finish
endif

echom "Our syntax highlighting code will go here."
syntax keyword powershellKeyword loop times to while
syntax keyword powershellKeyword if elsif else
syntax keyword type if elsif else
syntax keyword powershellKeyword class return
syntax keyword powershellFunction print join string

highlight link powershellKeyword Keyword
highlight link powershellFunction Function
let b:current_syntax = "powershell"
