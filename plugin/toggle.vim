" ===== 切换Colum ===== {{{
nnoremap <leader>f :call FoldColumToggle()<cr>

function! FoldColumToggle()
    "echom &foldcolumn
    if &foldcolumn
        setlocal foldcolumn=0
    else
        setlocal foldcolumn=4
    endif
endfunction "}}}

" ===== 切换Quickfix ===== {{{
nnoremap <leader>q :call QuickfixToggle()<cr>

let g:quickfix_is_open = 0

function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        "执行以那个序号作前缀的wincmd w,来告诉Vim跳转到对应窗口
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr() "保存执行:copen时的当前窗口序号
        copen
        let g:quickfix_is_open = 1
    endif
endfunction "}}}

" ===== 代码折叠 =====  {{{
map <leader>zz :call FoldToggle()<cr>

" 我开启了默认折叠，所以开始为1
let g:have_folded = 1

function! FoldToggle()
    if g:have_folded
        execute "normal! zR"
        let g:have_folded = 0
    else
        execute "normal! zM"
        let g:have_folded = 1
    endif
endfunction "}}}

" ===== 切换wrap =====
nnoremap <leader>wr :setlocal wrap! wrap?<cr>

" ===== 显示可打印字符开关 =====
nnoremap <leader>ls :setlocal list! list?<CR>

" ===== 语法开关，关闭语法可以加快大文件的展示 =====
nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>
