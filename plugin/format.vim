" ===== Default Indentation ===== {{{
set autoindent                  " 开启新行，从当前行负责缩进距离
set smartindent                 " 设置smartindent为默认值
set expandtab                   " 使用空格代替制表符
set tabstop=4                   " 插入模式下Tab键的宽度
set shiftwidth=4                " vim格式化时Tab的宽度
set softtabstop=4               " 将连续的空格视为Tab(方便删除)
set smarttab                    " 行首的 <Tab> 根据 'shiftwidth' 插入空白
"}}}

" ========= \t 将tab替换为空格 ========== {{{
inoremap \t <esc>:call RemoveTabs()<cr>
nnoremap \t :call RemoveTabs()<cr>

function RemoveTabs()
    let l:winview = winsaveview()
    silent! %s/\t/\=repeat(" ", &tabstop)/
    call winrestview(l:winview)
endfunction
"}}}

" ========= \w 去除所有尾部空白(white) ========= {{{
inoremap \w <esc>:call StripTrailingWhite()<cr>
nnoremap \w :call StripTrailingWhite()<cr>

" http://vim.wikia.com/wiki/remove_unwanted_spaces
function StripTrailingWhite()
    let l:winview = winsaveview()
    silent! %s/\s\+$//
    call winrestview(l:winview)
endfunction
"}}}

" clang-format {{{
map <c-l> :pyf ~/.vim/clang-format.py<cr>
imap <c-l> <esc>:pyf ~/.vim/clang-format.py<cr>

function FormatFile()
    let l:lines="all"
    pyf ~/.vim/.draft/clang-format.py
endfunction
"}}}
