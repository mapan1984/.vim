" ===== Default Indentation ===== {{{
set autoindent                  " 开启新行，从当前行负责缩进距离
set smartindent                 " 开启新行时使用智能自动缩进
set expandtab                   " 使用空格代替制表符
set tabstop=4                   " 插入模式下Tab键的宽度
set shiftwidth=4                " (自动) 缩进每一步使用的空白数目。用于 |'cindent'|、|>>|、|<<| 等(自动) 缩进每一步使用的空白数目。用于 |'cindent'|、|>>|、|<<| 等
set softtabstop=4               " 允许<Tab>和<Space>混合输入
set smarttab                    " 行首的 <Tab> 根据 'shiftwidth' 插入/删除空白
"}}}

" ========= \t 将tab替换为空格 ========== {{{
"inoremap \t <esc>:call format#RemoveTabs()<cr>
nnoremap \t :call format#RemoveTabs()<cr>
"}}}

" ========= \b 去除所有尾部空白(blank) ========= {{{
"inoremap \b <esc>:call format#StripTrailingBlank()<cr>
nnoremap \b :call format#StripTrailingBlank()<cr>
"autocmd BufWritePre * call format#RemoveTrailingWhitespace()
"}}}

" Use <tab> and <shift-tab> to indent {{{
""vnoremap <tab> >gv
""vnoremap <s-tab> <gv
xnoremap > >gv
xnoremap < <gv
"}}}
