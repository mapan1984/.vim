if exists("b:my_current_json_syntax")
  finish
endif

" jsonc 文件的注释
syntax match Comment +\/\/.\+$+

let b:my_current_json_syntax = "json"
