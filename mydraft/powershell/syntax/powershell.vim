if exists("b:current_syntax")
    finish
endif

echom "Our syntax highlighting code will go here."


syntax keyword powershellKeyword if elseif else switch
syntax keyword powershellKeyword for foreach do while
syntax keyword powershellKeyword break continue
syntax keyword powershellKeyword function return

syntax keyword powershellFunction Write-Host

syntax match powershellComment "\v^<#.*#>$"

syntax match powershellOperator "\v\*"
syntax match powershellOperator "\v/"
syntax match powershellOperator "\v\+"
syntax match powershellOperator "\v-"
syntax match powershellOperator "\v\?"
syntax match powershellOperator "\v\*\="
syntax match powershellOperator "\v/\="
syntax match powershellOperator "\v\+\="
syntax match powershellOperator "\v-\="

syntax region powershellString start=/\v"/ skip=/\v\\./ end=/\v"/

highlight link powershellKeyword Keyword
highlight link powershellFunction Function
highlight link powershellComment Comment
highlight link powershellOperator Operator
highlight link powershellString String


let b:current_syntax = "powershell"
