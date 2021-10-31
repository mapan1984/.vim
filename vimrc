" ===== 提前的全局配置 ===== {{{
" 取得本文件所在的目录
let g:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" 项目根目录标志
let g:project_root_markers = [
    \ '.root', '.project',
    \ '.vscode', '.idea', '.settings',
    \ '.git', '.hg', '.svn',
    \ 'Makefile',
    \ '.venv', 'requirements.txt',
    \ 'node_modules', 'package.json',
    \ ]

" 运行的操作系统
if has('unix')
    let g:os_is_linux = v:true
elseif has('win16') || has('win32') || has('win64')
    let g:os_is_windows = v:true
endif


let mapleader=','
let maplocalleader="\<Space>"

" 定义一个命令用来加载文件
if !exists(':LoadScript')
    command! -nargs=1 LoadScript exec 'source '.g:home.'/'.'<args>'
endif

" 定义一个命令用来加载 lua 文件
if has('nvim') && !exists(':LoadLuaScript')
    command! -nargs=1 LoadLuaScript exec 'luafile '.g:home.'/'.'<args>'
endif

" 修正alt键映射
LoadScript .utils/fix-alt-map.vim

" 文件搜索和补全时忽略下面扩展名
LoadScript .utils/ignore-file.vim

" Load Plugin
LoadScript plugins/init.vim
"}}}

" ===== Syntax ===== {{{
"if has('syntax')
"    " https://www.reddit.com/r/vim/comments/choowl/vimpolyglot_syntax_on_or_syntax_enable/
"    syntax enable                   " 开启语法高亮功能
"    syntax on                       " 允许用指定语法高亮配色方案替换默认方案
"
"    " 语法高亮在大文件跳转中失效：https://github.com/vim/vim/issues/2790
"    " https://vim.fandom.com/wiki/Fix_syntax_highlighting
"    " https://groups.google.com/g/vim_use/c/92m8ZEZniz0/m/e1T9CWNs7JIJ
"    " syntax sync minlines=10000
"    " syntax sync fromstart
"    " autocmd BufEnter * :syntax sync fromstart
"endif
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
" Italics in terminal vim
" https://www.reddit.com/r/vim/comments/24g8r8/italics_in_terminal_vim_and_tmux/
" let &t_ZH="\e[3m"
" let &t_ZR="\e[23m"
" set t_ZH=[3m
" set t_ZR=[23m

" true color support
if (has("termguicolors"))
  set t_8f=[38;2;%lu;%lu;%lum
  set t_8b=[48;2;%lu;%lu;%lum
  set termguicolors
endif
" if !has('gui_running')
"   set t_Co=256
" endif

if has('gui_running')
  colorscheme NeoSolarized
else
  colorscheme hybrid
endif
" colorscheme gruvbox
set background=dark             " 可选light/dark

" highlight Normal guibg=NONE ctermbg=None
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
" set list listchars=tab:→\ ,trail:•,extends:>,precedes:<,eol:$ " 设置分隔符可视
set list listchars=tab:→\ ,trail:•,extends:>,precedes:< " 设置分隔符可视

" set showtabline=2  " Show tabline
" set guioptions-=e  " Don't use GUI tabline
"}}}

" ===== Complete ===== {{{
" 不要加 preview，否则在补全列表中选择时会弹出 preview window 显示当前项的信息，会打乱当前窗口布局
" 增加 noselect，不要选择第一个选项，ctrl-n 之后才会跳到第一项，否则会到第二项
set completeopt=menu,menuone,noselect,noinsert
" 使用 popup，在补全列表中选择时会弹出 popup window 显示当前项的信息(vim8.2 之后支持)
if has('popupwin')
    set completeopt+=popup
endif

" don't give |ins-completion-menu| messages.
" set shortmess+=c
"}}}

" ===== Searching ===== {{{
set hlsearch                    " highlight the words match the search pattern
set incsearch                   " show the pattern as it was typed so far
set ignorecase                  " 设置大小写敏感和聪明感知(小写忽略大小写，包含大写字母则完全匹配)
set smartcase
" <backspace>取消搜索高亮
noremap <bs> :nohl<cr>
" noremap <c-h> :nohl<cr>
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
" tmux 配置：set-option -g escape-time 50
if $TMUX !=? ''
    set ttimeoutlen=30
elseif &ttimeoutlen > 80 || &ttimeoutlen <= 0
    set ttimeoutlen=80
endif
"}}}

" 定义一个 DiffOrig 命令用于查看文件改动 {{{
if !exists(':DiffOrig')
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
          \ | wincmd p | diffthis
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

" 水平切割窗口时，默认在右边显示新窗口，并移动鼠标到新窗口
set splitright

" quickfix 设置，隐藏行号
"----------------------------------------------------------------------
augroup VimInitStyle
    au!
    au FileType qf setlocal nonumber
augroup END
