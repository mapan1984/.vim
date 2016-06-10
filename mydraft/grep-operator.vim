" ========= grep ========= {{{
"Open vimgrep and put the cursor in the right position:
"noremap <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>
"Vimgreps in the current file:
"noremap <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>
"搜索光标下的词
"nnoremap <leader>G :grep -R '<cWORD>' .<cr>
"nnoremap <leader>g :execute "grep -R '<cWORD>' ."<cr>
"nnoremap <leader>g :execute "grep -R " . shellescape("<cWORD>") . " ."<cr>
"nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ./.vimrc"<cr>:copen<cr>
"}}}

nnoremap <leader>g :set operatorfunc=GrepOperator<cr>g@
vnoremap <leader>g :<c-u>call GrepOperator(visualmode())<cr>

function! GrepOperator(type)
"    echom a:type
    if a:type ==# 'v'
        execute "normal! `<v`>y"
    elseif a:type ==# 'char'
        execute "normal! `[v`]y"
    else
        return
    endif
"    echom shellescape(@@)
    silent execute "grep! -R " . shellescape(@@) . " ./grep-operator.vim"
endfunction
