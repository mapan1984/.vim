let g:airline_theme='hybrid'
" let g:airline_theme='gruvbox'

let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#ycm#enabled = 1

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

"" unicode symbols
let g:airline_left_sep = ''
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
let g:airline_right_sep = ''
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'

"let g:airline_symbols.crypt = '🔒'
"
"let g:airline_symbols.linenr = '☰'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'

"let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'

"let g:airline_symbols.branch = '⎇'
"
let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"
let g:airline_symbols.spell = 'Ꞩ'

let g:airline_symbols.notexists = 'Ɇ'

let g:airline_symbols.whitespace = 'Ξ'
