" 不同模式下用不同的光标颜色
if &term =~ "xterm\|rxvt"
  echom 'hello'
  silent !echo -ne "\e]12;HotPink\007"
  let &t_SI="\e]12;RoyalBlue1\007"
  let &t_EI="\e]12;HotPink\007"
  autocmd VimLeave * :!echo -ne "\e]12;green\007"
endif

let color_normal = 'HotPink'
let color_insert = 'RoyalBlue1'
" let color_exit = 'green'
if &term =~ 'xterm\|rxvt'
  exe 'silent !echo -ne "\e]12;"' . shellescape(color_normal, 1) . '"\007"'
  let &t_SI="\e]12;" . color_insert . "\007"
  let &t_EI="\e]12;" . color_normal . "\007"
  " exe 'autocmd VimLeave * :!echo -ne "\e]12;"' . shellescape(color_exit, 1) . '"\007"'
elseif &term =~ "screen"
  if !exists('$SUDO_UID')
    if exists('$TMUX')
      exe 'silent !echo -ne "\033Ptmux;\033\e]12;"' . shellescape(color_normal, 1) . '"\007\033\\"'
      let &t_SI="\033Ptmux;\033\e]12;" . color_insert . "\007\033\\"
      let &t_EI="\033Ptmux;\033\e]12;" . color_normal . "\007\033\\"
      " exe 'autocmd VimLeave * :!echo -ne "\033Ptmux;\033\e]12;"' . shellescape(color_exit, 1) . '"\007\033\\"'
    else
      exe 'silent !echo -ne "\033P\e]12;"' . shellescape(color_normal, 1) . '"\007\033\\"'
      let &t_SI="\033P\e]12;" . color_insert . "\007\033\\"
      let &t_EI="\033P\e]12;" . color_normal . "\007\033\\"
      " exe 'autocmd VimLeave * :!echo -ne "\033P\e]12;"' . shellescape(color_exit, 1) . '"\007\033\\"'
    endif
  endif
endif
unlet color_normal
unlet color_insert
" unlet color_exit
