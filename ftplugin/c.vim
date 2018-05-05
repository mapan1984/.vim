" snippet
iabbrev <buffer> mian main
" iabbrev <buffer> if if ) {}<left><cr><up><end><left><left><left>
" iabbrev <buffer> for for ) {}<left><cr><up><end><left><left><left>
" iabbrev <buffer> while while ) {}<left><cr><up><end><left><left><left>

" 帮助文档
nnoremap <buffer> K :<c-u>AsyncRun! man -S 3:2:1 <cword><cr>
