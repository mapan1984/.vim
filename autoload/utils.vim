function! utils#GetRAND()
    if g:os_is_linux
        return system("echo $RANDOM")
    elseif g:os_is_windows
        return system("echo %RANDOM%")
    endif
endfunction

function utils#Rand()
    return str2nr(matchstr(reltimestr(reltime()), '\v\.@<=\d+')[1:])
endfunction
