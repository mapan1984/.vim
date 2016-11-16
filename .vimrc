" ========= Vundle ========= {{{
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
"Plugin 'vim-scripts/Solarized'
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
 let g:indent_guides_start_level=1
 " 色块宽度
 let g:indent_guides_guide_size=1
 " 快捷键i开/关缩进可视化
 "nnoremap <silent> <Leader>i <Plug>IndentGuidesToggle
"}}}

" ========= nerdtree ========== {{{
Plugin 'scrooloose/nerdtree'
 nnoremap <c-b> :NERDTreeToggle<cr>
 " 设置相对行号
 "nnoremap <leader>nt :NERDTree<cr>:set rnu<cr>
 " open a NERDTree utomatically when vim starts up if no files were specified
 autocmd StdinReadPre * let s:std_in=1
 autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
 " close vim if the only window left open in a NERDTree
 autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
 " Store the bookmarks file
 " let NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks")
 " let NERDTreeShowBookmarks=1
 let g:NERDTreeShowFiles=1
 let g:NERDTreeShowHidden=1
 let g:NERDTreeIgnore=['\.$','\~$']
 "let NERDTreeShowLineNumbers=1
 let g:NERDTreeWinPos=0
"}}}

" ========= taglist ========= {{{
Plugin 'vim-scripts/taglist.vim'
 set tags=./tags;,tags
 let g:Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
 let g:Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
 let g:Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口 
 nnoremap <silent> tl :TlistToggle<cr>
" }}}

" ========= vim-markdown ========= {{{
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
 noremap <silent> to :Toc<cr>
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

" ========= supertab ========= {{{
Plugin 'ervandew/supertab'
"}}}

" ========= vim-fugitve ========= {{{
Plugin 'tpope/vim-fugitive'
"}}}

" ========= vim-json ========= {{{
Plugin 'elzr/vim-json'
 let g:vim_json_syntax_conceal = 0
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

" ========= Basic Settings ========= {{{
filetype on                     " enables filetype detection
syntax enable                   " 开启语法高亮功能
syntax on                       " 允许用指定语法高亮配色方案替换默认方案
set history=1000                " 历史记录数
set wildmenu                    " vim自身命令行模式智能补全
set autoread                    " 文件在Vim之外修改过，自动重新读入
set confirm                     " 在处理未保存或只读文件的时候，弹出确认
"set mouse=a                     " enable using the mouse if terminal emulator
"set mousehide                   " 在输入时隐藏鼠标指针

" ===== UI ===== {{{
set number                      " 显示行号
set numberwidth=4               " 行号栏的宽度
set cursorline                  " 设置光标高亮显示
set nowrap                      " 默认禁止自动换行
set colorcolumn=80              " 彩色显示第80行
set scrolloff=10                " 光标移动到buffer的顶部和底部时保持10行距离
set foldenable                  " 开启代码折叠
set foldmethod=syntax           " 语法高亮项目指定折叠
set hidden                      " hide buffers instead of closing them
set laststatus=2                " 总是显示状态行
set showcmd                     " 显示输入命令在状态栏
set showmode                    " show the mode of vim
set ruler                       " 显示光标位置的行号和列号
"}}}

" ===== encoding ===== {{{
set encoding=utf-8              " Vim内部文件(寄存器、缓冲区...)的编码为 UTF-8
" 自动判断编码，依次尝试以下顺序
set fileencodings=ucs-bom,utf-8,cp936,gb18030,default,big5,euc-jp,euc-kr,latin1

set helplang=cn                 " 帮助系统设置为中文
" set iskeyword+=%,&,#,-          " set the keywords将-连接符也设置为单词
" set spell spelllang=en_us       " spell checking
"}}}

" ===== 无限undo ===== {{{
set undolevels=1000             " use many much levels of undo
if v:version >= 704
    set undofile                " keep a persistent backup file
    set undodir=~/.vim/.undo
endif
"}}}

" ===== 禁止临时文件 ===== {{{
set nobackup                    " 禁止生成备份文件
set noswapfile                  " do not write annoying intermediate swap files,
                                "   who did ever restore from swap files anyway?
set directory=~/.vim/.tmp
                                " store swap files in one of these directories
                                "   (in case swapfile is ever turned on)
"}}}

" ===== Searching ===== {{{
set hlsearch                    " highlight the words match the search pattern
set incsearch                   " show the pattern as it was typed so far
set ignorecase                  " 设置大小写敏感和聪明感知(小写忽略大小写，包含大写字母则完全匹配)
set smartcase
set showmatch                   " jump to the matching bracket
" 取消搜索高亮
noremap nh :nohl<cr>

" 在当前文件下寻找光标下的词，在quickfix中显示
"nnoremap <leader>g :execute "grep! -R " . shellescape(expand("<cWORD>")) . " %"<cr>:copen<cr>
" open quickfix window after any grep invocation
autocmd QuickFixCmdPost *grep* cwindow
"}}}

set whichwrap=b,s,<,>,[,]       " 让<BS>，<Space>，<Left>, <Right>遇到行首行尾时自动移到下一行
set backspace=indent,eol,start  " 使回格键（backspace）正常处理indent, eol, start等
"}}}

" ========= Map =========== {{{
" 设置leader键
let mapleader=","
let maplocalleader="\<Space>"

inoremap jk <ESC>
"vnoremap jk <ESC>

" Treat long lines as break lines (useful when moving around in them)
noremap j gj
noremap k gk

" jump the middle postion
inoremap zz <c-o>zz

" first you need add 'stty -ixon' to .bashrc to forbid <c-s> suspend stty
nnoremap <c-s> :w<CR>
inoremap <c-s> <esc>:w<cr>i

" first you need add 'stty -ixon' to .bashrc to forbid <c-q> regain stty
nnoremap <c-q> :q<CR>
inoremap <c-q> <esc>:q<cr>i

" 使用tab键来代替%进行匹配跳转
nnoremap <tab> %
vnoremap <tab> %

" ===== Brackets ===== {{{
" auto complete
inoremap (p ()<ESC>i
inoremap [p []<ESC>i
inoremap {p {}<ESC>i
inoremap {<cr> {<cr>}<esc>O
inoremap <p <><esc>i
inoremap 'p ''<esc>i
inoremap "p ""<esc>i
inoremap (P ()<ESC>i
inoremap [P []<ESC>i
inoremap {P {}<ESC>i
inoremap <P <><esc>i
inoremap "P ""<esc>i

" ( = i(
onoremap ( i(
onoremap { i{
onoremap [ i[
onoremap < i<
onoremap " i"
onoremap ' i'

" 下一个括号的内容
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap in[ :<c-u>normal! f[vi(<cr>
onoremap in< :<c-u>normal! f<vi<<cr>
onoremap in" :<c-u>normal! f"vi"<cr>
onoremap in' :<c-u>normal! f'vi'<cr>
"}}}

" ===== 插入模式下移动 ===== {{{
inoremap <c-a> <home>
inoremap <c-e> <end>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-f> <right>
inoremap <c-b> <left>
"}}}

" ===== 使用用系统剪切板 ===== {{{
nnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>y "+y
vnoremap <leader>p "+p
"}}}

" Switch CWD to the directory of the open buffer:
noremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" 编辑,重载.vimrc
"nnoremap <silent> <leader>ev :vsplit $MYVIMRC<CR>
"nnoremap <silent> <leader>sv :source $MYVIMRC<CR>
"}}}

" 打文件后开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写 {{{
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
"}}}

"修改.vimrc后自动载入配置文件不需要重启
"autocmd! bufwritepost .vimrc source %
