" 临时文件文件夹
if g:os_is_linux
    if has('nvim')
        " stdpath('data')
        let s:tmp_dir = $HOME . '/.local/share/nvim/.tmp'
        set viminfo   ='100,n$HOME/.local/share/nvim/.tmp/info/nviminfo
    else
        let s:tmp_dir = $HOME . '/.vim/.tmp'
        set viminfo   ='100,n$HOME/.vim/.tmp/info/viminfo
    endif
    let s:path_sep = '/'
elseif s:os_is_windows
    if has('nvim')
        let s:tmp_dir = $HOME . '\nvim\.tmp'
        set viminfo=%,<800,'10,/50,:100,h,f0,n~/nvim/.tmp/info/.viminfo
        "           | |    |   |   |    | |  + viminfo file path
        "           | |    |   |   |    | + file marks 0-9,A-Z 0=NOT stored
        "           | |    |   |   |    + disable 'hlsearch' loading viminfo
        "           | |    |   |   + command-line history saved
        "           | |    |   + search history saved
        "           | |    + files marks saved
        "           | + lines saved each register (old name for <, vi6.2)
        "           + save/restore buffer list
    else
        let s:tmp_dir = $HOME . '\vimfiles\.tmp'
        set viminfo=%,<800,'10,/50,:100,h,f0,n~/vimfiles/.tmp/info/.viminfo
        "           | |    |   |   |    | |  + viminfo file path
        "           | |    |   |   |    | + file marks 0-9,A-Z 0=NOT stored
        "           | |    |   |   |    + disable 'hlsearch' loading viminfo
        "           | |    |   |   + command-line history saved
        "           | |    |   + search history saved
        "           | |    + files marks saved
        "           | + lines saved each register (old name for <, vi6.2)
        "           + save/restore buffer list
    endif
    let s:path_sep = '\'
endif

let &backupdir=s:tmp_dir . s:path_sep . 'backup'
let &directory=s:tmp_dir . s:path_sep . 'swap'
let &undodir=s:tmp_dir . s:path_sep . 'undo'

" 如果文件夹不存在，则新建文件夹
if !isdirectory(s:tmp_dir) && exists('*mkdir')
  call mkdir(s:tmp_dir.'/backup', 'p')
  call mkdir(s:tmp_dir.'/swap', 'p')
  call mkdir(s:tmp_dir.'/undo', 'p')
  call mkdir(s:tmp_dir.'/info', 'p')
endif

" 备份文件 {{{
set backup
set writebackup              " 保存时备份
"set backupext=.bak  " 备份文件扩展名
set backupext   =-vimbackup
set backupskip  =
"}}}

" 交换文件 {{{
"set noswapfile  " 禁用交换文件
set updatecount =100
set updatetime  =500
"}}}

" 撤销文件 {{{
"set noundofile  " 禁用 undo文件
set undolevels  =1000             " use many much levels of undo
set undofile
"}}}

" viminfo 文件{{{
set history  =500                " 历史记录数
"}}}
