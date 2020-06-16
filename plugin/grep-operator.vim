" ===== vimgrep ===== {{{
" 在当前文件下寻找光标下的词，在quickfix中显示
" nnoremap <leader>g :execute "grep! -R " . shellescape(expand("<cWORD>")) . " %"<cr>:copen<cr>
" 在当前文件搜索选择的部分
" vnoremap <silent> <localleader>g "gy:vimgrep /<C-R>g/ % \|copen<cr>
" 在当前文件搜索
" nnoremap <localleader>g :vimgrep // % \|copen<left><left><left><left><left><left><left><left><left><left>

" Open quickfix window after any grep invocation
" autocmd QuickFixCmdPost *grep* cwindow
"}}}

nnoremap <leader>g :set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <leader>g :<c-u>call <SID>GrepOperator(visualmode())<cr>

function! s:GrepOperator(type)
    let saved_unnamed_register = @@

    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    else
        return
    endif

    silent execute "grep! -R " . shellescape(@@) . " ."
    copen

    let @@ = saved_unnamed_register
endfunction
