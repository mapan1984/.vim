""" c:\Users\mapan\vimfiles\vimrc

" 设置文件编码格式
if has("multi_byte")
    set encoding=utf-8
    set termencoding=utf-8
    set formatoptions+=mM
    set fileencodings=utf-8,chinese,latin-1,gbk,gb18030,gk2312
    if v:lang =~? '^/(zh/)/|/(ja/)/|/(ko/)'
        set ambiwidth=double
    endif
    if has("win32")
        set fileencoding=chinese
    else
        set fileencoding=utf-8
    endif
    if has("win32")
        source $VIMRUNTIME/delmenu.vim
        source $VIMRUNTIME/menu.vim
        language messages zh_CN.utf-8
    endif
else
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif

if has("gui_running")
    "au GUIEnter * simalt ~x    " 窗口启动时自动最大化
    "set guioptions-=m          " 隐藏菜单栏
    set guioptions-=T           " 隐藏工具栏
    set guioptions-=L          " 隐藏左侧滚动条
    set guioptions-=r          " 隐藏右侧滚动条
    set guioptions-=b          " 隐藏底部滚动条
    "set showtabline=0          " 隐藏Tab栏
    set guioptions-=e           " 使用内置 tab 样式而不是 gui

    set lines=48 columns=148    " 初始界面大小
endif

" 使用windowns下的配置
set runtimepath^=~/.vim
set runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vim/vimrc

" 字体
set guifont=Fira\ Code:h10

" 使用内置 tab 样式而不是 gui
set guioptions-=e
set nolist

" colorscheme murphy
colorscheme NeoSolarized

" 用闪烁替代错误 bell
set noerrorbells
" set visualbell
set vb t_vb=

" 输入法自动切换中英文（不适用于外挂输入法）
set noimcmdline
set iminsert=2
set imsearch=2

