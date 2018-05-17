" ===== 切换Colum =====
nnoremap <leader>c :call toggle#FoldColumToggle()<cr>

" ===== 切换Quickfix =====
nnoremap <leader>q :call toggle#QuickfixToggle()<cr>

" ===== 代码折叠 =====
nnoremap <leader>z :call toggle#FoldToggle()<cr>

" ===== 切换wrap =====
nnoremap <leader>w :setlocal wrap! wrap?<cr>

" ===== 语法开关，关闭语法可以加快大文件的展示 =====
""nnoremap <leader>s :exec exists('syntax_on') ? 'syntax off' : 'syntax on'<CR>
nnoremap <leader>s :if exists("g:syntax_on") <Bar>
                  \   syntax off <Bar>
                  \ else <Bar>
                  \   syntax enable <Bar>
                  \ endif <CR>
