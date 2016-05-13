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
Plugin 'vim-scripts/Solarized'
 set background=dark
 colorscheme solarized
 let g:solarized_termtrans  = 1
 let g:solarized_termcolors = 256
 let g:solarized_contrast   = "high"
 let g:solarized_visibility = "high"
 set t_Co=256                 "设置256色显示
 set cursorline               "设置光标高亮显示
 set colorcolumn=85           "彩色显示第85行

Plugin 'Lokaltog/vim-powerline'
 set guifont=PowerlineSymbols\ for\ Powerline
 let g:Powerline_symbols = 'fancy'

Plugin 'scrooloose/nerdtree'
 nmap tr :NERDTreeToggle<cr>
 "设置相对行号
 nmap <leader>nt :NERDTree<cr>:set rnu<cr>
 "open a NERDTree a"utomatically when vim starts up if no files were specified
 autocmd StdinReadPre * let s:std_in=1
 autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
 " close vim if the only window left open is a NERDTree
 autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
 let NERDTreeShowBookmarks=1
 let NERDTreeShowFiles=1
 let NERDTreeShowHidden=1
 let NERDTreeIgnore=['\.$','\~$']
 "let NERDTreeShowLineNumbers=1
 let NERDTreeWinPos=0

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
 map to :Toc<cr>
 let g:vim_markdown_folding_disabled = 1
 let g:vim_markdown_folding_level = 6
 let g:vim_markdown_no_default_key_mappings = 1
 let g:vim_markdown_toc_autofit = 1
 let g:vim_markdown_emphasis_multiline = 0
 set conceallevel=2
 let g:vim_markdown_conceal = 0
 let g:vim_markdown_frontmatter = 1
 let g:vim_markdown_new_list_item_indent = 2

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

filetype on                      " enables filetype detection

" common conf {{
syntax on                       " support syntax highlight
set laststatus=2                " 启动显示状态行(1),总是显示状态行(2)
set showmode                    " show the mode
set showcmd                     " 显示输入命令
set history=1000                " 历史记录数
set undofile                    " 无限undo
set mouse=a                     " enable using the mouse if terminal emulator
                                "    supports it (xterm does)

set autoread                    " 文件在Vim之外修改过，自动重新读入
set foldmethod=syntax           " folds are created manually
"set pastetoggle=<F2>           " when in insert mode, press <F2> to go to
                                " paste mode, where you can paste mass data
                                " that won't be autoindented
set iskeyword+=_,$,@,%,#,-      " set the keywords将-连接符也设置为单词
set wrap linebreak nolist       " wrap at a character in the breakat option
"set nowrap                      " 禁止自动换行
set textwidth=0                 " maximum width in a line
set hidden

set helplang=cn                 " 帮助系统设置为中文
"set spelllang=en                " spell checking
set fileencodings=utf-8,ucs-bom,cp936,gb18030,default,big5,euc-jp,euc-kr,latin1
"set encoding=utf-8

set number                      " 显示行号
set numberwidth=4               " 行号栏的宽度
"set relativenumber             " 相对行号,要想相对行号起作用要放在显示行号后面
set scrolloff=3                 " 光标移动到buffer的顶部和底部时保持3行距离 

set confirm                     " 在处理未保存或只读文件的时候，弹出确认 

"禁止生成临时文件 
 set nobackup 
 set noswapfile 

" Searching
 set hlsearch                    " highlight the words match the search pattern
 set incsearch                   " show the pattern as it was typed so far
 set ignorecase                  " 设置大小写敏感和聪明感知(小写全搜，大写完全匹配)
 set smartcase                   " the case of normal letters is ignored
 set showmatch                   " jump to the matching bracket
 "取消搜索高亮
 nnoremap <leader>n :nohl<CR>
 "搜索替换
 nmap <leader>s :1,%s///cg<left><left><left><left>

" Default Indentation
 set autoindent                  " indent automatically
 set smartindent
 set tabstop=4                   " Tab键的宽度
 set softtabstop=4               " 统一缩进为4
 set shiftwidth=4                " 
 set expandtab                   " 使用空格代替制表符
 set smarttab                    " insert tabs on the start of a line according to

 set whichwrap=b,s,<,>,[,]       " 让退格，空格，上下箭头遇到行首行尾时自动移到下一行（包括insert模式）
 set backspace=indent,eol,start  " 使回格键（backspace）正常处理indent, eol, start等
"}}

"设置leader键
let mapleader="\<Space>"

inoremap jj <ESC>

" Brackets auto-complete
inoremap {<cr> {<esc>o}<esc>O
inoremap 'p ''<esc>i
inoremap "p ""<esc>i
inoremap <p  <><esc>i
inoremap (p ()<ESC>i
inoremap {p {}<ESC>i
inoremap [p []<ESC>i

"插入模式下移动
imap <c-a> <home>
imap <c-e> <end>
imap <c-j> <down>
imap <c-k> <up>
imap <c-l> <right>
imap <c-h> <left>

nmap <leader>w :w<CR>
nmap <leader>q :q<CR>

"使用<space>wi来垂直分割窗口，这样可以同时查看多个文件,如果想水平分割则<c-w>s
nnoremap <leader>ve :Vexplore<cr>
nmap <leader>wc <c-w>c
nmap <leader>ww <c-w>w
"窗口移动
map wj <c-w>j
map wh <c-w>h
map wk <c-w>k
map wl <c-w>l

nnoremap <leader>te :Texplore<cr>

"系统剪切
nmap <leader>y "+y
vmap <leader>y "+y
nmap <leader>p "+p
vmap <leader>p "+p

""使用tab键来代替%进行匹配跳转
nmap <tab> %
vmap <tab> %

"html中的js加注释 取消注释
nmap <leader>ac I//jj
nmap <leader>cc ^xx
 
" rt 将tab替换为空格 
imap <leader>rt <ESC>:%s/\t/    /g<CR>
vmap <leader>rt <ESC>:%s/\t/    /g<CR>
nmap <leader>rt :%s/\t/    /g<CR>

" rb 一键去除所有尾部空白
imap <leader>rb <ESC>:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
vmap <leader>rb <ESC>:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
nmap <leader>rb :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" rl 去空行   
nnoremap <leader>rl :g/^\s*$/d<CR>  

" ======= 编译 && 运行 && 模板 ======= "
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

" rr 一键保存、编译、运行
imap <leader>rr <ESC>:call Compile_Run_Code()<CR>
vmap <leader>rr <ESC>:call Compile_Run_Code()<CR>
nmap <leader>rr :call Compile_Run_Code()<CR>

"打开配置文件
nmap <silent> <leader>ev :e $MYVIMRC<CR>
"重载配置文件
nmap <silent> <leader>sv :so $MYVIMRC<CR>

"autocmd! bufwritepost .vimrc source %         "自动载入配置文件不需要重启
