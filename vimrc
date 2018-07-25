" ===== 提前的全局配置 ===== {{{
" 取得本文件所在的目录
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" 项目根目录标志
let g:project_root_markers = ['.root', '.vscode', '.git', '.hg', 'Makefile', '.venv', 'package.json', 'requirements.txt']

" 运行的操作系统
if has('unix')
    let g:os = 'linux'
elseif has('win16') || has('win32') || has('win64')
    let g:os = 'win'
endif

let mapleader=','
let maplocalleader="\<Space>"

" 定义一个命令用来加载文件
command! -nargs=1 LoadScript exec 'source '.s:home.'/'.'<args>'

" 修正alt键映射
LoadScript .utils/fix-alt-map.vim

" Load Plugin
LoadScript bundle/init.vim

" 文件搜索和补全时忽略下面扩展名
LoadScript .utils/ignore-file.vim
"}}}

" ===== Syntax ===== {{{
if has('syntax')
    syntax enable                   " 开启语法高亮功能
    syntax on                       " 允许用指定语法高亮配色方案替换默认方案
endif
"}}}

" ===== Lang & Encode ===== {{{
" set helplang=cn                 " 帮助系统设置为中文
" set spell spelllang=en_us       " spell checking
" set iskeyword+=%,&,-            " set the keywords将-连接符也设置为单词

if has('multi_byte')
    set encoding=utf-8              " Vim内部文件(寄存器、缓冲区...)的编码为 UTF-8
    set termencoding=utf-8
    set fileencoding=utf-8
    set fileencodings=ucs-bom,utf-8,gbk,cp936,gb18030,big5,euc-jp,euc-kr,latin1 " 自动判断编码，依次尝试以下顺序
endif

set formatoptions+=m     " 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=B     " 合并两行中文时，不在中间加空格
set fileformats=unix,dos,mac     " 文件换行符，默认使用 unix 换行符
"}}}

" ===== UI ===== {{{
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
""if (empty($TMUX))
""  if (has("nvim"))
""    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
""    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
""  endif
""  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
""  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
""  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
""  if (has("termguicolors"))
""    set termguicolors
""  endif
""endif
" Hack to make vim work well in tmux, `^[` represent the escape char(<Ctrl-v>+<esc>).
set t_8f=^[[38;2;%lu;%lu;%lum
set t_8b=^[[48;2;%lu;%lu;%lum
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
" set t_ZH=^[[3m
" set t_ZR=^[[23m

colorscheme hybrid
set background=dark             " 可选light/dark
set number                      " 显示行号
set numberwidth=3               " 行号栏的宽度
" set cursorline                  " 光标当前行高亮显示
" set cursorcolumn                " 光标当前列高亮显示
" 当前行高亮只在当前窗口并且不处于插入模式下生效
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline
set nowrap                      " 默认禁止自动换行
set colorcolumn=81              " 彩色显示第81行
set scrolloff=10                " 光标移动到buffer的顶部和底部时保持10行距离
set foldenable                  " 开启代码折叠
" set foldmethod=syntax           " 语法高亮项目指定折叠
set hidden                      " hide buffers instead of closing them
set mousehide                   " 在输入时隐藏鼠标指针
set laststatus=2                " 总是显示状态行
set showcmd                     " 显示输入命令在状态栏
set showmode                    " show the mode of vim
set ruler                       " 显示光标位置的行号和列号
set showmatch                   " show the matching bracket
set matchtime=2                 " time of show the matching bracket
set display=lastline            " 显示最后一行
set lazyredraw                  " 延迟绘制（提升性能）
set errorformat+=[%f:%l]\ ->\ %m,[%f:%l]:%m   " 错误格式
set list listchars=tab:→\ ,trail:•,extends:>,precedes:< " 设置分隔符可视
"}}}

" ===== 临时文件 ===== {{{
" 临时文件文件夹
if g:os == 'linux'
    let g:tmp_dir = $HOME.'/.vim/.tmp'
elseif g:os == 'win'
    let g:tmp_dir = $HOME.'/vimfiles/.tmp'
endif

" 如果文件夹不存在，则新建文件夹
if !isdirectory(g:tmp_dir) && exists('*mkdir')
  call mkdir(g:tmp_dir.'')
  call mkdir(g:tmp_dir.'/backup')
  call mkdir(g:tmp_dir.'/swap')
  call mkdir(g:tmp_dir.'/undo')
  call mkdir(g:tmp_dir.'/info')
endif

" 备份文件 {{{
set backup
set writebackup              " 保存时备份
set backupdir   =$HOME/.vim/.tmp/backup/
set backupext   =-vimbackup
set backupskip  =
"}}}

" 交换文件 {{{
set directory   =$HOME/.vim/.tmp/swap/
set updatecount =100
set updatetime  =500
"}}}

" 撤销文件 {{{
set undolevels  =1000             " use many much levels of undo
set undofile
set undodir     =$HOME/.vim/.tmp/undo/
"}}}

" viminfo 文件{{{
set history  =500                " 历史记录数
set viminfo  ='100,n$HOME/.vim/.tmp/info/viminfo
"}}}
"}}}

" ===== Searching ===== {{{
set hlsearch                    " highlight the words match the search pattern
set incsearch                   " show the pattern as it was typed so far
set ignorecase                  " 设置大小写敏感和聪明感知(小写忽略大小写，包含大写字母则完全匹配)
set smartcase
" <backspace>取消搜索高亮
noremap <bs> :nohl<cr>
" noremap <c-h> :nohl<cr>

" 在当前文件下寻找光标下的词，在quickfix中显示
"nnoremap <leader>g :execute "grep! -R " . shellescape(expand("<cWORD>")) . " %"<cr>:copen<cr>

" Open quickfix window after any grep invocation
autocmd QuickFixCmdPost *grep* cwindow
"}}}

" ===== Reaction ===== {{{
" set mouse=a                     " enable using the mouse if terminal emulator
set wildmenu                    " vim自身命令行模式智能补全

set confirm                     " 在处理未保存或只读文件的时候，弹出确认
set whichwrap=b,s,<,>,[,]       " 让<BS>，<Space>，<Left>, <Right>遇到行首行尾时自动移到下一行
set backspace=indent,eol,start  " 使回格键（backspace）正常处理indent, eol, start等
" set clipboard=unnamed

" ttimeoutlen {{{
" 根据时间间隔区分<m-x>和<esc><x>键
if $TMUX != ''
    set ttimeoutlen=30
elseif &ttimeoutlen > 80 || &ttimeoutlen <= 0
    set ttimeoutlen=80
endif
"}}}

" 文件在Vim之外修改过，自动重新读入 {{{
set autoread 
"au CursorHold,CursorHoldI * checktime " Trigger when cursor stops moving
"au FocusGained,BufEnter * :checktime  " Trigger on buffer change ot terminal focus
" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
"}}}

" 打文件后开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写 {{{
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
"}}}

" 修改.vimrc后自动载入配置文件不需要重启
" autocmd! bufwritepost $MYVIMRC source $MYVIMRC
"}}}

