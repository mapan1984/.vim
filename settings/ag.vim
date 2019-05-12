" Use ag over grep
set grepprg=ag\ --nogroup\ --nocolor
let g:ag_prg='ag --vimgrep --smart-case'
let g:ag_highlight=1
let g:ag_working_path_mode='r'

" Bind `K` to grep word under cursor
"nnoremap K :grep! "\b<C-R><C-W>\b" <CR>:cw<CR>
