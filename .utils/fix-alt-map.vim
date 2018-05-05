"""""" 正确的映射alt键
" 1. 勾选终端的选项`Use ALT as meta key`和`Send escape for meta key`
" 2. 在终端运行命令`showkey -a`，按下`ALT_a`查看是否发送了0x1b, 0x61两个字节
" 3. 区分ALT_x和先按ESC再按x，设置功能键超时
"    3.1 在vim中：`:set ttimeout ttimeoutlen=50`
"    3.2 在tmux中：`set-option -g escape-time 50`
" 4. 在vim中加键盘码配置如下`Terminal_MetaMode`
"""""""""""""

" 功能键超时
":set ttimeout ttimeoutlen=50

" 键盘码配置
function! Terminal_MetaMode(mode)
    if has('nvim') || has('gui_running')
        return
    endif
    function! s:metacode(mode, key)
        if a:mode == 0
            exec "set <M-".a:key.">=\e".a:key
        else
            exec "set <M-".a:key.">=\e]{0}".a:key."~"
        endif
    endfunc
    for i in range(10)
        call s:metacode(a:mode, nr2char(char2nr('0') + i))
    endfor
    for i in range(26)
        call s:metacode(a:mode, nr2char(char2nr('a') + i))
        call s:metacode(a:mode, nr2char(char2nr('A') + i))
    endfor
    if a:mode != 0
        for c in [',', '.', '/', ';', '[', ']', '{', '}']
            call s:metacode(a:mode, c)
        endfor
        for c in ['?', ':', '-', '_']
            call s:metacode(a:mode, c)
        endfor
    else
        for c in [',', '.', '/', ';', '{', '}']
            call s:metacode(a:mode, c)
        endfor
        for c in ['?', ':', '-', '_']
            call s:metacode(a:mode, c)
        endfor
    endif
    set ttimeout
    if $TMUX != ''
        set ttimeoutlen=30
    elseif &ttimeoutlen > 80 || &ttimeoutlen <= 0
        set ttimeoutlen=80
    endif
endfunc

call Terminal_MetaMode(0)
