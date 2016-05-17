" ========= Vundle ==============={{{
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" ========= solarized ========= {{{
Plugin 'vim-scripts/Solarized'
 set background=dark
 colorscheme solarized
 let g:solarized_termtrans  = 1
 let g:solarized_termcolors = 256
 let g:solarized_contrast   = "high"
 let g:solarized_visibility = "high"
"}}}

" ========= vim-powerline ========= {{{
Plugin 'Lokaltog/vim-powerline'
 set guifont=PowerlineSymbols\ for\ Powerline
 set t_Co=256                 "设置256色显示
 let g:Powerline_symbols = 'fancy'
 let g:Powerline_colorscheme = 'solarized256'
"}}}

" ========= vim-indent-guides ========== {{{
Plugin 'nathanaelkane/vim-indent-guides'
 " 随vim自启动
 let g:indent_guides_enable_on_vim_startup=1
 " 从第二层开始可视化显示缩进
 let g:indent_guides_start_level=2
 " 色块宽度
 let g:indent_guides_guide_size=1
 " 快捷键i开/关缩进可视化
 nnoremap <silent> <Leader>i <Plug>IndentGuidesToggle
"}}}

" ========= nerdtree ========== {{{
Plugin 'scrooloose/nerdtree'
 nnoremap tr :NERDTreeToggle<cr>
 " 设置相对行号
 nnoremap <leader>nt :NERDTree<cr>:set rnu<cr>
 " open a NERDTree utomatically when vim starts up if no files were specified
 autocmd StdinReadPre * let s:std_in=1
 autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
 " close vim if the only window left open in a NERDTree
 autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
 " let NERDTreeShowBookmarks=1
 let NERDTreeShowFiles=1
 let NERDTreeShowHidden=1
 let NERDTreeIgnore=['\.$','\~$']
 "let NERDTreeShowLineNumbers=1
 let NERDTreeWinPos=0
"}}}

" ========= vim-signature ========= {{{
Plugin 'kshenoy/vim-signature'
 nnoremap <silent> <Leader>; :SignatureToggle<cr>
 nnoremap <silent> <leader>r :SignatureRefresh<cr>
"}}}

" ========= vim-markdown ========= {{{
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
 noremap to :Toc<cr>
 let g:vim_markdown_folding_disabled = 1
 let g:vim_markdown_folding_level = 6
 let g:vim_markdown_no_default_key_mappings = 1
 let g:vim_markdown_toc_autofit = 1
 let g:vim_markdown_emphasis_multiline = 0
 set conceallevel=2
 let g:vim_markdown_conceal = 0
 let g:vim_markdown_frontmatter = 1
 let g:vim_markdown_new_list_item_indent = 2
"}}}

" All of your Plugins must be added before the following line
call vundle#end()            " required

" 载入文件类型插件,为特定文件类型载入相关缩进文件
filetype plugin indent on    " required enables filetype plugin
"                                       enables filetype indent
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" }}}

" ========= Basic Settings ===================={{{
filetype on                     " enables filetype detection
syntax enable                   " 开启语法高亮功能
syntax on                       " 允许用指定语法高亮配色方案替换默认方案
set showmode                    " show the mode
set showcmd                     " 显示输入命令
set wildmenu                    " vim自身命令行模式智能补全
set history=1000                " 历史记录数
"set undofile                    " 无限undo
set mouse=a                     " enable using the mouse if terminal emulator
                                " supports it (xterm does)

set autoread                    " 文件在Vim之外修改过，自动重新读入
set confirm                     " 在处理未保存或只读文件的时候，弹出确认
set nobackup                    " 禁止生成临时文件
set noswapfile

"set pastetoggle=<F2>           " when in insert mode, press <F2> to go to
                                " paste mode, where you can paste mass data
                                " that won't be autoindented

set helplang=cn                 " 帮助系统设置为中文
set iskeyword+=%,&,#,-          " set the keywords将-连接符也设置为单词
"set spelllang=en               " spell checking
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,default,big5,euc-jp,euc-kr,latin1

" ===== 外观 ===== {{{
set number                      " 显示行号
set numberwidth=4               " 行号栏的宽度
"set relativenumber             " 相对行号,要想相对行号起作用要放在显示行号后面
set cursorline                  " 设置光标高亮显示
set colorcolumn=85              " 彩色显示第85行
set laststatus=2                " 启动显示状态行(1),总是显示状态行(2)
set ruler                       " 显示光标当前位置
set scrolloff=3                 " 光标移动到buffer的顶部和底部时保持3行距离
set foldmethod=syntax           " folds are created manually
set nowrap                      " 禁止自动换行
set textwidth=0                 " maximum width in a line
"set wrap linebreak nolist       " wrap at a character in the breakat option
set hidden
"}}}

" ===== Searching ===== {{{
 set hlsearch                    " highlight the words match the search pattern
 set incsearch                   " show the pattern as it was typed so far
 set ignorecase                  " 设置大小写敏感和聪明感知(小写全搜，大写完全匹配)
 set smartcase                   " the case of normal letters is ignored
 set showmatch                   " jump to the matching bracket
 " 取消搜索高亮
 noremap <leader>nh :nohl<cr>
 " 搜索替换
 nnoremap <leader>s :1,%s///cg<left><left><left><left>
"}}}

" ===== Indentation ===== {{{
 set autoindent                  " indent automatically
 set smartindent
 set expandtab                   " 使用空格代替制表符
 set tabstop=4                   " 插入模式下Tab键的宽度
 set shiftwidth=4                " 格式化时Tab的宽度
 set softtabstop=4               " 将连续的空格视为Tab(方便删除)
 set smarttab                    " insert tabs on the start of a line according to
"}}}

set whichwrap=b,s,<,>,[,]       " 让退格，空格，上下箭头遇到行首行尾时自动移到下一行（包括insert模式）
set backspace=indent,eol,start  " 使回格键（backspace）正常处理indent, eol, start等
"}}}

" ========= Map ============{{{
"设置leader键
let mapleader=","
let maplocalleader="\<Space>"

inoremap jk <ESC>
vnoremap jk <ESC>

" Treat long lines as break lines (useful when moving around in them)
noremap j gj
noremap k gk

nnoremap ww :<CR>
nnoremap qq :q<CR>

" 使用tab键来代替%进行匹配跳转
nnoremap <tab> %
vnoremap <tab> %

" 切换wrap
nnoremap <leader>nw :setlocal wrap!<cr>

" ===== Brackets auto-complete ===== {{{
inoremap {<cr> {<esc>o}<esc>O
inoremap 'p ''<esc>i
inoremap "p ""<esc>i
inoremap <p <><esc>i
inoremap (p ()<ESC>i
inoremap {p {}<ESC>i
inoremap [p []<ESC>i
inoremap `p ``<esc>i
" 为单词加<kbd>标签
nnoremap <leader>` viw<esc>a</kbd><esc>6hbi<kbd><esc>lelel
"}}}

" ===== 插入模式下移动 ===== {{{
inoremap <c-a> <home>
inoremap <c-e> <end>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-f> <right>
inoremap <c-b> <left>
"}}}

" ===== 使用窗口 ===== {{{
nnoremap <leader>ve :Vexplore<cr>
nnoremap <leader>wc <c-w>c
nnoremap <leader>ww <c-w>w
noremap wj <c-w>j
noremap wh <c-w>h
noremap wk <c-w>k
noremap wl <c-w>l
"}}}

" ===== Tab page ===== {{{
nnoremap <leader>tx :Texplore<cr>
" Opens a new tab with the current buffer's path
noremap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
noremap <leader>tn :tabnew<cr>
noremap <leader>to :tabonly<cr>
noremap <leader>tc :tabclose<cr>
noremap <leader>tm :tabmove 
"}}}

" ===== 系统剪切 ===== {{{
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>p "+p
"}}}

" Switch CWD to the directory of the open buffer:
noremap <leader>cd :cd %:p:h<cr>:pwd<cr>
"}}}

" ========= 编译 && 运行 ================= {{{
"简单编译
"nmap <leader>p :!python %<CR>
" 编译并运行
func! Compile_Run_Code()
    exec "w"
    if &filetype == "c"
        exec "!gcc -Wall -std=c11 -o %:r %:t"
        exec "!time ./%:r"
    elseif &filetype == "cpp"
        exec "!g++ -Wall -std=c++14 -o %:r %:t"
        exec "!time ./%:r"
    elseif &filetype == "scheme"
        exec "!guile -l %:t"
    elseif &filetype == "python"
        exec "!python3 %:t"
    elseif &filetype == "sh"
        exec "!bash %:t"
    endif
endfunc

" rr 保存、编译、运行
inoremap <leader>rr <ESC>:call Compile_Run_Code()<CR>
vnoremap <leader>rr <ESC>:call Compile_Run_Code()<CR>
nnoremap <leader>rr :call Compile_Run_Code()<CR>
"}}}

" ========= Vim脚本文件设置 ============ {{{
" 为Vim脚本文件设置折叠
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    "自动载入配置文件不需要重启
    "autocmd! bufwritepost .vimrc source %
augroup END

" 编辑,重载.vimrc 
nnoremap <silent> <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <silent> <leader>sv :source $MYVIMRC<CR>
"}}}

" 打开新文件保存
"autocmd BufNewFile * :write

autocmd BufNewFile *.sh :normal! i#!/bin/bash\<esc>o
autocmd BufNewFile *.py execute "normal! i#!/usr/bin/env python3\<esc>o# -*- coding: utf-8 -*-\<esc>o"

" ========= html autocmd ========= {{{
" 用autocmd！清除同名的自动命令
augroup filetype_html
    autocmd!
    autocmd BufNewFile,BufRead *.html setlocal nowrap
    autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
    "保存文件前，读取前,格式化
    "autocmd BufWritePre,BufRead *.html :normal! gg=G
    autocmd FileType html :iabbrev <buffer> < &ldquo;
    autocmd FileType html :iabbrev <buffer> > &rdquo;
augroup END
"}}}

" ========= markdown autocmd ========= {{{
augroup filetype_markdown
    autocmd!
    autocmd FileType markdown :setlocal wrap
    " 在markdown中定位到' ^==+$\r '，使用cih(change inside heading)
    autocmd FileType markdown onoremap ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
    " cah(change around heading)
    autocmd FileType markdown onoremap ah :<c-u>execute "normal! ?^==\\+\r:nohlsearch\rg_vk0"<cr>
    autocmd FileType markdown :iabbrev <buffer> @@ mapan1984@outlook.com
    autocmd FileType markdown :iabbrev <buffer> link []()<esc>2hi
    autocmd FileType markdown :iabbrev <buffer> kb <kbd></kbd><esc>b2hi
augroup END
"}}}

" ========= coding autocmd ========== {{{
augroup coding
    autocmd!
    "在末尾加分号
    autocmd FileType c,cpp,javascript noremap <leader>; A;<esc>
    "自动扩展if
    autocmd FileType javascript,c,cpp :iabbrev <buffer> iff if ()<left>
    autocmd FileType python           :iabbrev <buffer> iff if:<left>
augroup END
"}}}
    
" Movement映射
" dp=di(operator-movement)
onoremap p i(
" 删除到return
onoremap b /return<cr>
" 删除下一个括号的内容
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap in[ :<c-u>normal! f[vi(<cr>

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
