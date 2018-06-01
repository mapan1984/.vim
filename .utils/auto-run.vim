"单个文件编译
map <F5> :call DoOneFileMake()<CR>
function DoOneFileMake()
    " 如果不在当前路径
    if expand("%:p:h")!=getcwd()
        " exec "noremal! :cd %:p:h\<cr>:pwd\<cr>"
        echohl WarningMsg | echo "Fail to make! This file is not in the current dir! Press `:cd %:p:h` to redirect to the dir of this file." | echohl None
        return
    endif
    " 如果文件不存在或不是cpp或c文件
    let sourcefileename=expand("%:t")
    if (sourcefileename=="" || (&filetype!="cpp" && &filetype!="c"))
        echohl WarningMsg | echo "Fail to make! Please select the right file!" | echohl None
        return
    endif
    " 如果文件名存在空格
    let deletedspacefilename=substitute(sourcefileename,' ','','g')
    if strlen(deletedspacefilename)!=strlen(sourcefileename)
        echohl WarningMsg | echo "Fail to make! Please delete the spaces in the filename!" | echohl None
        return
    endif

    if &filetype=="c"
        set makeprg=gcc\ -o\ %<\ %
    elseif &filetype=="cpp"
        set makeprg=g++\ -o\ %<\ %
    endif

    let outfilename=substitute(sourcefileename,'\(\.[^.]*\)' ,'','g')
    let toexename=outfilename
    if filereadable(outfilename)
        let outdeletedsuccess=delete("./".outfilename)
        if(outdeletedsuccess!=0)
            set makeprg=make
            echohl WarningMsg | echo "Fail to make! I cannot delete the ".outfilename | echohl None
            return
        endif
    endif
    execute "silent make"
    set makeprg=make
    execute "normal :"
    if filereadable(outfilename)
        execute "!./".toexename
    endif
    execute "copen"
endfunction
