" ===== 切换Colum =====
nnoremap <leader>c :call toggle#FoldColumToggle()<cr>

" ===== 切换Quickfix =====
nnoremap <leader>q :call toggle#QuickfixToggle()<cr>
"command -bang -nargs=? QFix call QFixToggle(<bang>0)
"function! QFixToggle(forced)
"  if exists("g:qfix_win") && a:forced == 0
"    cclose
"    unlet g:qfix_win
"  else
"    copen 10
"    let g:qfix_win = bufnr("$")
"  endif
"endfunction

" ===== 代码折叠 =====
nnoremap <leader>z :call toggle#FoldToggle()<cr>

" ===== 切换wrap =====
nnoremap <leader>w :setlocal wrap! wrap?<cr>

" ===== 语法开关，关闭语法可以加快大文件的展示 =====
""nnoremap <leader>s :exec exists('syntax_on') ? 'syntax off' : 'syntax on'<CR>
" nnoremap <leader>s :if exists("g:syntax_on") <Bar>
"                   \   syntax off <Bar>
"                   \ else <Bar>
"                   \   syntax enable <Bar>
"                   \ endif <CR>
nnoremap <leader>s :call toggle#SyntaxToggle()<cr>

" ===== 切换LocationList =====
command -bang -nargs=? Llt call toggle#LocalListToggle(<bang>0)
nnoremap <leader>l :Llt<cr>
