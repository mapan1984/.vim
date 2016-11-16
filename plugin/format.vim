" ===== Default Indentation ===== {{{
set autoindent                  " 开启新行，从当前行负责缩进距离
set smartindent                 " 设置smartindent为默认值
set expandtab                   " 使用空格代替制表符
set tabstop=4                   " 插入模式下Tab键的宽度
set shiftwidth=4                " vim格式化时Tab的宽度
set softtabstop=4               " 将连续的空格视为Tab(方便删除)
set smarttab                    " 行首的 <Tab> 根据 'shiftwidth' 插入空白
"}}}

" ========= rt 将tab替换为空格 ========== {{{
inoremap <leader>rt <esc>:call RemoveTabs()<cr>
nnoremap <leader>rt :call RemoveTabs()<cr>

function RemoveTabs()
    let l:winview = winsaveview()
    silent! %s/\t/\=repeat(" ", &tabstop)/
    call winrestview(l:winview)
endfunction
"}}}

" ========= rb 去除所有尾部空白 ========= {{{
inoremap <leader>rb <esc>:call StripTrailingWhite()<cr>
nnoremap <leader>rb :call StripTrailingWhite()<cr>

" http://vim.wikia.com/wiki/remove_unwanted_spaces
function StripTrailingWhite()
    let l:winview = winsaveview()
    silent! %s/\s\+$//
    call winrestview(l:winview)
endfunction
"}}}
"
" rl 去空行 {{{
nnoremap <leader>rl :g/^\s*$/d<CR>
"}}}

" clang-format {{{
map <c-l> :pyf ~/.vim/clang-format.py<cr>
imap <c-l> <esc>:pyf ~/.vim/clang-format.py<cr>

function FormatFile()
  let l:lines="all"
  pyf ~/.vim/clang-format.py
endfunction
"}}}
