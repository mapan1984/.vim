" 临时文件文件夹
if g:os ==? 'linux'
    let g:tmp_dir = $HOME . '/.vim/.tmp'
elseif g:os ==? 'win'
    if has('nvim')
        let g:tmp_dir = $HOME . '\nvim\.tmp'
    else
        let g:tmp_dir = $HOME . '\vimfiles\.tmp'
    endif
endif

" 如果文件夹不存在，则新建文件夹
if !isdirectory(g:tmp_dir) && exists('*mkdir')
  call mkdir(g:tmp_dir.'/backup', 'p')
  call mkdir(g:tmp_dir.'/swap', 'p')
  call mkdir(g:tmp_dir.'/undo', 'p')
  call mkdir(g:tmp_dir.'/info', 'p')
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

" 临时文件文件夹
if g:os == 'linux'
    let g:tmp_dir = $HOME.'/.vim/.tmp'
    set backupdir =$HOME/.vim/.tmp/backup
    set directory =$HOME/.vim/.tmp/swap
    set undodir   =$HOME/.vim/.tmp/undo
    if has('nvim')
        set viminfo   ='100,n$HOME/.vim/.tmp/info/nviminfo
    else
        set viminfo   ='100,n$HOME/.vim/.tmp/info/viminfo
    endif
elseif g:os == 'win'
    if has('nvim')
        let g:tmp_dir = $HOME . '\nvim\.tmp'
        set backupdir =$HOME\nvim\.tmp\backup
        set directory =$HOME\nvim\.tmp\swap
        set undodir   =$HOME\nvim\.tmp\undo
        "set viminfo   ='100,n$HOME\nvim\.tmp\info\viminfo

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
        let g:tmp_dir = $HOME.'\vimfiles\.tmp'
        set backupdir =$HOME\vimfiles\.tmp\backup
        set directory =$HOME\vimfiles\.tmp\swap
        set undodir   =$HOME\vimfiles\.tmp\undo
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
endif

