" This program is free software. It comes without any warranty, to
" the extent permitted by applicable law. You can redistribute it
" and/or modify it under the terms of the Do What The Fuck You Want
" To Public License, Version 2, as published by Sam Hocevar. See
" http://www.wtfpl.net/txt/copying/ for more details. */
"
" ==ABOUT==
" Power VIM Users like us have already wasted tons of time to choose
" our favorite colorschemes, and may still not be satisfied with the
" current colorschemes. So I wrote this plugin to help us out, to
" meet the perfect colorsheme that we are `DESTINED` to be with.
" just like your lovely girlfriends/wifves:)
" Written by sunus Lee: sunus.the.dev@gmail.com


" 获取运行系统名称
if !exists('g:os')
    if has('unix')
        let g:os = 'linux'
    elseif has('win16') || has('win32') || has('win64')
        let g:os = 'win'
    endif
endif

" 设置存放`.love`, `.hate`文件的路径
if g:os == 'linux'
    let g:plugin_path = fnamemodify(resolve(expand('<sfile>:p')), ':h')
    let g:slash = '/'
    if exists('g:tmp_dir')
        let g:love_path = g:tmp_dir.'/.love'
        let g:hate_path = g:tmp_dir.'/.hate'
    else
        let g:love_path = g:plugin_path.'/.love'
        let g:hate_path = g:plugin_path.'/.hate'
    end
elseif g:os == 'win'
    let g:plugin_path = $HOME.'/vimfiles/plugin'
    let g:slash = '\'
    if exists('g:tmp_dir')
        let g:love_path = g:tmp_dir.'\love.txt'
        let g:hate_path = g:tmp_dir.'\hate.txt'
    else
        let g:love_path = g:plugin_path.'\love.txt'
        let g:hate_path = g:plugin_path.'\hate.txt'
    end
endif

" 获取当前设置的`colorscheme`
" (`g:colors_name`为vim规定的当前`colorscheme`的名字，一般在`color`文件中定义；
" `g:colors_name`为我自己定义的变量)
if exists('g:colors_name')
    let g:colorscheme = g:colors_name
else
    let g:colorscheme = 'default'
endif

" Get all the colorscheme file dir
let s:colorscheme_dirs = []
for i in split(&runtimepath, ',')
    if !empty(glob(i.'/colors'))
        call add(s:colorscheme_dirs, i.'/colors')
    endif
endfor

" Current colorscheme file path
let g:colorscheme_file_path = ''

" Get all colorscheme file path
let g:colorscheme_file_paths= []
for colorsheme_dir in s:colorscheme_dirs
    let s:colorschemes = glob(colorsheme_dir.'/*.vim')
    let g:colorscheme_file_paths += split(s:colorschemes, '\n')
endfor

" Get the total number of all colorschemes
let g:total_colorschemes = len(g:colorscheme_file_paths)


function! GetRAND()
    if g:os == 'linux'
        return system("echo $RANDOM")
    elseif g:os == 'win'
        return system("echo %RANDOM%")
    endif
endfunction


function! ApplyCS(colorscheme)
    let cmd = 'colorscheme '.a:colorscheme
    execute cmd
endfunction


function! colorschemepicker#RandomPick()
    " Get all hate colorsheme file path
    let hates = []
    let r = findfile(g:hate_path)
    if r != ''
        let hates = readfile(g:hate_path)
    endif

    " Get all love colorsheme
    let loves = []
    let r = findfile(g:love_path)
    if r != ''
        let loves = readfile(g:love_path)
    endif

    " Try apply the love colorscheme
    if len(loves) > 0
        let g:colorscheme = loves[0]
        call ApplyCS(g:colorscheme)
        return
    endif

    " Randomly get a colorscheme that not in hate file
    while 1
        let rand = GetRAND() % g:total_colorschemes
        let g:colorscheme_file_path = g:colorscheme_file_paths[rand]
        if index(hates, g:colorscheme_file_path) == -1
            break
        endif
    endwhile

    " colorscheme is /path/to/colorscheme.vim
    " convert to colorscheme
    let g:colorscheme = split(g:colorscheme_file_path, g:slash)[-1][:-5]
    call ApplyCS(g:colorscheme)
    call colorschemepicker#ShowCS()
endfunction


" 把当前colorscheme加入到.love文件
function! colorschemepicker#LoveCS()
    execute writefile([g:colorscheme], g:love_path)
endfunction


" 删除.love文件，将当前colorscheme路径加入.hate文件，随机展示下一个colorscheme
function! colorschemepicker#HateCS()
    call delete(g:love_path)
    let r = findfile(g:hate_path)
    if r != ''
        let hates = readfile(g:hate_path)
    else
        let hates = []
    endif
    if len(hates) + 1 == g:total_colorschemes
        redrawstatus
        echo "She is the last one you got, Can't hate it anymore, or :Back first."
    else
        call add(hates, g:colorscheme_file_path)
        call writefile(hates, g:hate_path)
        call colorschemepicker#RandomPick()
    endif
endfunction


" Clear .hate file
function! colorschemepicker#BackCS()
    execute writefile([], g:hate_path)
    redrawstatus
    echom "you've got all the previously hated colorschemes back"
endfunction


" Echom current colorscheme
function! colorschemepicker#ShowCS()
    redrawstatus
    echom 'using colorscheme: '.g:colorscheme
endfunction


" 检测光标位置处文字的样式名
function! colorschemepicker#SynStack()
    echo map(synstack(line('.'),col('.')),'synIDattr(v:val, "name")')
endfunc

