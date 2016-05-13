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
 set colorcolumn=85           "彩色显示第85行
 set t_Co=256                 "设置256色显示
 set cursorline               "设置光标高亮显示
 set backspace=indent,eol,start

 function! ToggleBackground()
     if (w:solarized_style=="dark")
     let w:solarized_style="light"
     colorscheme solarized
 else
     let w:solarized_style="dark"
     colorscheme solarized
 endif
 endfunction
 command! Togbg call ToggleBackground()
 nnoremap <F5> :call ToggleBackground()<CR>
 inoremap <F5> <ESC>:call ToggleBackground()<CR>a
 vnoremap <F5> <ESC>:call ToggleBackground()<CR>

Plugin 'Lokaltog/vim-powerline'
 set guifont=PowerlineSymbols\ for\ Powerline
 set nocompatible
 set t_Co=256
 let g:Powerline_symbols = 'fancy'

Plugin 'scrooloose/nerdtree'
 map tr :NERDTreeToggle<cr>
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
 let NERDTreeShowLineNumbers=1
 let NERDTreeWinPos=0

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
 let g:vim_markdown_folding_disabled = 1
 let g:vim_markdown_folding_level = 6
 let g:vim_markdown_no_default_key_mappings = 1
 let g:vim_markdown_toc_autofit = 1
 let g:vim_markdown_emphasis_multiline = 0
 let g:vim_markdown_frontmatter = 1

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" common conf {{
syntax on                       " support syntax highlight
set bs=2
set laststatus=2                " 显示状态栏
set showmode                    " show the mode
set showcmd
set history=1000
set undofile                    " 无限undo
set mouse=a                     " enable using the mouse if terminal emulator
                                "    supports it (xterm does)

set autoread                    " 文件在Vim之外修改过，自动重新读入
set foldmethod=syntax           " folds are created manually
"set pastetoggle=<F2>           " when in insert mode, press <F2> to go to
                                "    paste mode, where you can paste mass data
                                "    that won't be autoindented
set iskeyword+=_,$,@,%,#,-      " set the keywords将-连接符也设置为单词
set confirm                     " prompt when existing from an unsaved file
set wrap linebreak nolist       " wrap at a character in the breakat option
set nowrap                      " 禁止自动换行
set textwidth=0                 " maximum width in a line
set hidden
set noswapfile
set nowritebackup

set helplang=cn                 " 帮助系统设置为中文
set spelllang=en                " spell checking
set fileencodings=ucs-bom,utf-8,cp936,gb18030,default,big5,euc-jp,euc-kr,latin1
set fenc=utf-8
set encoding=utf-8

set number                      " 显示行号
set numberwidth=4               " 行号栏的宽度
""相对行号 要想相对行号起作用要放在显示行号后面
"set relativenumber
set scrolloff=4                 " keep 4 lines off the edges of the screen when scrolling

" Searching
 set incsearch                   " show the pattern as it was typed so far
 set ignorecase                  " 设置大小写敏感和聪明感知(小写全搜，大写完全匹配)
 set smartcase                   " the case of normal letters is ignored
 set hlsearch                    " highlight the words match the search pattern
 set showmatch                   " jump to the matching bracket
 "取消搜索高亮
 nmap <silent> <leader>n :nohlsearch<CR>

" Default Indentation
 set autoindent                  " indent automatically
 set smartindent
 set tabstop=4                   " number of spaces a <Tab> counts for
 set softtabstop=4               " Number of spaces that a <Tab> counts for
 set shiftwidth=4                " number of spaces each step of
 set smarttab                    " insert tabs on the start of a line according to
 set expandtab
                                 " shiftwidth, not tabstop
 set whichwrap=b,s,<,>,[,]       "让退格，空格，上下箭头遇到行首行尾时自动移到下一行（包括insert模式）

let g:html_number_lines = 0      "buffer text is displayed in the generated

filetype on                      " enables filetype detection
filetype plugin on               " enables filetype plugin
filetype indent on               " enables filetype indent
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

"搜索替换
nmap <leader>s :1,%s///cg<left><left><left><left>

"按,ev打开配置文件
nmap <silent> <leader>ev :e $MYVIMRC<CR>
"按,sv重载配置文件
nmap <silent> <leader>sv :so $MYVIMRC<CR>
"按,w保存文件
nmap <leader>w :w<CR>
"按,e在新tab打开文件
nmap <leader>e :tabe<Space>
"按,r在当前tab打开文件
nmap <leader>r :e<Space>


"使用<space>wi来垂直分割窗口，这样可以同时查看多个文件,如果想水平分割则<c-w>s
nnoremap <leader>wi <c-w>v<c-w>l
nmap <leader>wc <c-w>c
nmap <leader>ww <c-w>w
"窗口移动
map wj <c-w>j
map wh <c-w>h
map wk <c-w>k
map wl <c-w>l

"系统剪切
nmap <leader>y "+y
vmap <leader>y "+y
nmap <leader>p "+p
vmap <leader>p "+p

""使用tab键来代替%进行匹配跳转
nmap <tab> %
vmap <tab> %

"折叠html标签 ,fold tag
nnoremap <leader>ft vatzf
""使用,v来选择刚刚复制的段落，这样可以用来缩进
nnoremap <leader>v v`]
"不要进入vim的Ex模式，太2333了
nnoremap Q <nop>

"html中的js加注释 取消注释
nmap <leader>h I//jj
nmap <leader>ch ^xx

" \rb                 一键去除所有尾部空白
imap <leader>rb <ESC>:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
nmap <leader>rb :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
vmap <leader>rb <ESC>:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" \rt                 一键替换全部Tab为空格
func! RemoveTabs()
    if &shiftwidth == 2
        exec "%s/    /  /g"
    elseif &shiftwidth == 4
        exec "%s/    /    /g"
    elseif &shiftwidth == 6
        exec "%s/    /      /g"
    elseif &shiftwidth == 8
        exec "%s/    /        /g"
    else
        exec "%s/    / /g"
    end
endfunc

imap <leader>rt <ESC>:call RemoveTabs()<CR>
vmap <leader>rt <ESC>:call RemoveTabs()<CR>
nmap <leader>rt :call RemoveTabs()<CR>

" ======= 编译 && 运行 && 模板 ======= "

"简单编译
"nmap <leader>p :!python %<CR>

" 编译并运行
func! Compile_Run_Code()
    exec "w"
    if &filetype == "c"
        if g:iswindows
            exec "!gcc -Wall -std=c11 -o %:r %:t && %:r.exe"
        else
            exec "!clang -Wall -std=c11 -o %:r %:t && ./%:r"
        endif
    elseif &filetype == "cpp"
        if g:iswindows
            exec "!g++ -Wall -std=c++14 -o %:r %:t && %:r.exe"
        else
            exec "!clang++ -Wall -std=c++14 -o %:r %:t && ./%:r"
        endif
    elseif &filetype == "scheme"
        exec "!guile -l %:t"
    elseif &filetype == "python"
        exec "!python %:t"
    elseif &filetype == "sh"
        exec "!bash %:t"
    endif
endfunc

" \rr        一键保存、编译、运行
imap <leader>rr <ESC>:call Compile_Run_Code()<CR>
vmap <leader>rr <ESC>:call Compile_Run_Code()<CR>
nmap <leader>rr :call Compile_Run_Code()<CR>

autocmd! bufwritepost .vimrc source %         "自动载入配置文件不需要重启
