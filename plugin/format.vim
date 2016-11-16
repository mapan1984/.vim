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

func! RemoveTabs()
    if &shiftwidth ==# 2
        execute '%s/\t/  /g'
    elseif &shiftwidth ==# 4
        execute '%s/\t/    /g'
    else
        execute '%s/\t/    /g'
    endif
endfunc
"}}}

" rb 去除所有尾部空白 {{{
inoremap <leader>rb <ESC>:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
nnoremap <leader>rb :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
"}}}

" rl 去空行 {{{
nnoremap <leader>rl :g/^\s*$/d<CR>
"}}}

" clang-format {{{
map <c-k> :pyf ~/.vim/clang-format.py<cr>
imap <c-k> <esc>:pyf ~/.vim/clang-format.py<cr>

function FormatFile()
  let l:lines="all"
  pyf ~/.vim/clang-format.py
endfunction
"}}}
