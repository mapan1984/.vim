" wsl 下 vim 复制到 windows 系统剪切板
function! yank#WslYank()
    let l:tmpfile = tempname()
    execute "normal! `<v`>y"
    execute "normal! :new " . l:tmpfile . "\<cr>VGp"
    execute "normal! :x\<cr>"
    execute "normal! :!cat " . l:tmpfile . " \| clip.exe \<cr>\<cr>"
    execute "normal! :!rm -f " . l:tmpfile . "\<cr>\<cr>"
endfunction

