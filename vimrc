" ========= Plugin ========= {{{
set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/bundle')

" ===== solarized ===== {{{
Plug 'altercation/vim-colors-solarized'
 let g:solarized_termtrans  = 1
 let g:solarized_termcolors = 256
 let g:solarized_contrast   = "high"
 let g:solarized_visibility = "high"
"}}}

" ===== vim-airline ===== {{{
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
 set laststatus=2     " 总是显示状态行
 let g:airline_theme='solarized'
 " let g:airline#extensions#tabline#enabled = 1
 " let g:airline_extensions=['fugitive', 'ctrlp', 'nerdtree', 'vim-gitgutter']
"}}}

" ===== lightline ===== {{{
" Plug 'itchyny/lightline.vim'
" let g:lightline = {
"       \ 'colorscheme': 'solarized',
"       \ 'component': {
"       \   'readonly': '%{&readonly?"x":""}',
"       \ },
"       \ 'separator': { 'left': '', 'right': '' },
"       \ 'subseparator': { 'left': '|', 'right': '|' }
"       \ }
"}}}

" ===== vim-indent-guides ===== {{{
Plug 'nathanaelkane/vim-indent-guides'
 " let g:indent_guides_enable_on_vim_startup=1
 let g:indent_guides_auto_colors=0
 let g:indent_guides_start_level=2
 let g:indent_guides_guide_size=1
 let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'vim',
                                        \ 'markdown', 'tex', ' ']
 autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
 autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
 " 快捷键i开/关缩进可视化
 nnoremap <silent> <c-i> :IndentGuidesToggle<cr>
"}}}

" ===== nerdtree ===== {{{
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
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
 let g:NERDTreeIgnore=['\.git$', '\.gitignore$', '\.vscode$', '\.idea$',
                     \ '^__pycache__$', '\.pyc$', '^myvenv$',
                     \ '\.aux$', '\.log$', '\.out$', '\.pdf$', '\.gz$',
                     \ '^node_modules$',
                     \ '^\.undo$','^\.tmp$', '^\.netrwhist$',
                     \ '\.sass-cache$']
 "let NERDTreeShowLineNumbers=1
 let g:NERDTreeWinPos=0
"}}}

" ===== taglist ===== {{{
Plug 'vim-scripts/taglist.vim'
 set tags=./tags;,tags
 nnoremap <silent> tl :TlistToggle<cr>
 let g:Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
 let g:Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
 let g:Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口
"}}}

" ===== supertab ===== {{{
Plug 'ervandew/supertab'
"}}}

" ===== ctrlp ===== {{{
Plug 'ctrlpvim/ctrlp.vim'
 set wildignore+=*/tmp/*,*\\tmp\\*,*.so,*.swp,*.zip,*.exe,*/.sass-cache/*,*/node_modules/*

 let g:ctrlp_map = '<c-p>'
 let g:ctrlp_cmd = 'CtrlP'

 let g:ctrlp_working_path_mode = 'ra'

 let g:ctrlp_custom_ignore = {
   \ 'dir':  '\v[\/]\.(git|hg|svn)$',
   \ 'file': '\v\.(exe|so|dll)$',
   \ }
"}}}

" ===== ag.vim ===== {{{
Plug 'rking/ag.vim'
 let g:ag_prg="/usr/bin/ag --vimgrep"
 let g:ag_working_path_mode="r"
"}}}

" ===== incsearch ===== {{{
" Plug 'haya14busa/incsearch.vim'
"map /  <Plug>(incsearch-forward)
"map ?  <Plug>(incsearch-backward)
"map g/ <Plug>(incsearch-stay)
"" :h g:incsearch#auto_nohlsearch
"" set hlsearch
"let g:incsearch#auto_nohlsearch = 1
"map n  <Plug>(incsearch-nohl-n)
"map N  <Plug>(incsearch-nohl-N)
"map *  <Plug>(incsearch-nohl-*)
"map #  <Plug>(incsearch-nohl-#)
"map g* <Plug>(incsearch-nohl-g*)
"map g# <Plug>(incsearch-nohl-g#)
"}}}

" ===== vim-fugitve ===== {{{
Plug 'tpope/vim-fugitive'
"}}}

" ===== vim-gitgutter ===== {{{
Plug 'airblade/vim-gitgutter'
 set updatetime=250
"}}}

" ===== Ci ===== {{{
Plug 'mapan1984/Ci', {'branch': 'forme'}
"}}}

" ===== vim-markdown ===== {{{
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
 let g:vim_markdown_folding_disabled = 1
 let g:vim_markdown_folding_level = 6
 let g:vim_markdown_no_default_key_mappings = 1
 let g:vim_markdown_toc_autofit = 1
 let g:vim_markdown_emphasis_multiline = 0
 let g:vim_markdown_conceal = 0
 let g:vim_markdown_frontmatter = 1
 let g:vim_markdown_new_list_item_indent = 2
"}}}

" ===== vim-javascript ===== {{{
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
"}}}

" ===== vim-python-pep8-indent ===== {{{
Plug 'hynek/vim-python-pep8-indent'
"}}}


call plug#end()

" 载入文件类型插件,为特定文件类型载入相关缩进文件
filetype plugin indent on    " required enables filetype plugin
                             "          enables filetype indent
" }}}

" ===== Other Settings ===== {{{
filetype on                     " enables filetype detection
syntax enable                   " 开启语法高亮功能
syntax on                       " 允许用指定语法高亮配色方案替换默认方案
set history=1000                " 历史记录数
set wildmenu                    " vim自身命令行模式智能补全
set autoread                    " 文件在Vim之外修改过，自动重新读入
set confirm                     " 在处理未保存或只读文件的时候，弹出确认
set encoding=utf-8              " Vim内部文件(寄存器、缓冲区...)的编码为 UTF-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1 " 自动判断编码，依次尝试以下顺序
" set helplang=cn                 " 帮助系统设置为中文
" set iskeyword+=%,&,#,-          " set the keywords将-连接符也设置为单词
" set spell spelllang=en_us       " spell checking
set whichwrap=b,s,<,>,[,]       " 让<BS>，<Space>，<Left>, <Right>遇到行首行尾时自动移到下一行
set backspace=indent,eol,start  " 使回格键（backspace）正常处理indent, eol, start等
"set mouse=a                     " enable using the mouse if terminal emulator
"set mousehide                   " 在输入时隐藏鼠标指针
let mapleader=","               " 设置leader键
let maplocalleader="\<Space>"   " localleader
" cmap w!! w !sudo tee % > /dev/null  " 没有写权限时使用w!!
" set clipboard=unnamed
"}}}

" ===== UI ===== {{{
set background=dark             " 可选light/dark
colorscheme solarized
set number                      " 显示行号
set numberwidth=3               " 行号栏的宽度
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
set list listchars=tab:→\ ,trail:•
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
" noremap nh :nohl<cr>

" 在当前文件下寻找光标下的词，在quickfix中显示
"nnoremap <leader>g :execute "grep! -R " . shellescape(expand("<cWORD>")) . " %"<cr>:copen<cr>

" open quickfix window after any grep invocation
autocmd QuickFixCmdPost *grep* cwindow
"}}}

" 打文件后开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写 {{{
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
"}}}

"修改.vimrc后自动载入配置文件不需要重启
"autocmd! bufwritepost .vimrc source %

