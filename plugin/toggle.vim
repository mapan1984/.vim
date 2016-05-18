" ===== 切换Colum =====
nnoremap <leader>f :call FoldColumToggle()<cr>

function! FoldColumToggle()
    "echom &foldcolumn
    if &foldcolumn
        setlocal foldcolumn=0
    else
        setlocal foldcolumn=4
    endif
endfunction

" ===== 切换Quickfix =====
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
endfunction

" 切换wrap
nnoremap <leader>wr :setlocal wrap!<cr>
