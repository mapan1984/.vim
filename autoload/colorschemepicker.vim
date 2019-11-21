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
    let s:plugin_path = fnamemodify(resolve(expand('<sfile>:p')), ':h')
    let s:slash = '/'
    if exists('g:tmp_dir')
        let s:love_path = g:tmp_dir.'/.love'
        let s:hate_path = g:tmp_dir.'/.hate'
    else
        let s:love_path = s:plugin_path.'/.love'
        let s:hate_path = s:plugin_path.'/.hate'
    end
elseif g:os == 'win'
    let s:plugin_path = $HOME.'/vimfiles/plugin'
    let s:slash = '\'
    if exists('g:tmp_dir')
        let s:love_path = g:tmp_dir.'\love.txt'
        let s:hate_path = g:tmp_dir.'\hate.txt'
    else
        let s:love_path = s:plugin_path.'\love.txt'
        let s:hate_path = s:plugin_path.'\hate.txt'
    end
endif

" 获取当前设置的`colorscheme`
" (`g:colors_name`为vim规定的当前`colorscheme`的名字，一般在`color`文件中定义；
" `s:colorscheme`为我自己定义的变量)
if exists('g:colors_name')
    let s:colorscheme = g:colors_name
else
    let s:colorscheme = 'default'
endif

" Get all the colorscheme file dir
let s:colorscheme_dirs = []
for i in split(&runtimepath, ',')
    if !empty(glob(i.'/colors'))
        call add(s:colorscheme_dirs, i.'/colors')
    endif
endfor

" Current colorscheme file path
let s:colorscheme_file_path = ''

" Get all colorscheme file path
let s:colorscheme_file_paths= []
for colorsheme_dir in s:colorscheme_dirs
    let s:colorschemes = glob(colorsheme_dir.'/*.vim')
    let s:colorscheme_file_paths += split(s:colorschemes, '\n')
endfor

" Get the total number of all colorschemes
let s:total_colorschemes = len(s:colorscheme_file_paths)


function! ApplyCS(colorscheme)
    let cmd = 'colorscheme '.a:colorscheme
    execute cmd
endfunction


function! colorschemepicker#RandomPick()
    " Get all hate colorsheme file path
    let hates = []
    let r = findfile(s:hate_path)
    if r != ''
        let hates = readfile(s:hate_path)
    endif

    " Get all love colorsheme
    let loves = []
    let r = findfile(s:love_path)
    if r != ''
        let loves = readfile(s:love_path)
    endif

    " Try apply the love colorscheme
    if len(loves) > 0
        let s:colorscheme = loves[0]
        call ApplyCS(s:colorscheme)
        return
    endif

    " Randomly get a colorscheme that not in hate file
    while 1
        let rand = utils#GetRAND() % s:total_colorschemes
        let s:colorscheme_file_path = s:colorscheme_file_paths[rand]
        if index(hates, s:colorscheme_file_path) == -1
            break
        endif
    endwhile

    " colorscheme is /path/to/colorscheme.vim
    " convert to colorscheme
    let s:colorscheme = split(s:colorscheme_file_path, s:slash)[-1][:-5]
    call ApplyCS(s:colorscheme)
    call colorschemepicker#ShowCS()
endfunction


" 把当前colorscheme加入到.love文件
function! colorschemepicker#LoveCS()
    execute writefile([s:colorscheme], s:love_path)
endfunction


" 删除.love文件，将当前colorscheme路径加入.hate文件，随机展示下一个colorscheme
function! colorschemepicker#HateCS()
    call delete(s:love_path)
    let r = findfile(s:hate_path)
    if r != ''
        let hates = readfile(s:hate_path)
    else
        let hates = []
    endif
    if len(hates) + 1 == s:total_colorschemes
        redrawstatus
        echo "She is the last one you got, Can't hate it anymore, or :Back first."
    else
        call add(hates, s:colorscheme_file_path)
        call writefile(hates, s:hate_path)
        call colorschemepicker#RandomPick()
    endif
endfunction


" Clear .hate file
function! colorschemepicker#BackCS()
    execute writefile([], s:hate_path)
    redrawstatus
    echom "you've got all the previously hated colorschemes back"
endfunction


" Echom current colorscheme
function! colorschemepicker#ShowCS()
    redrawstatus
    echom 'using colorscheme: '.s:colorscheme
endfunction


" 检测光标位置处文字的样式名
function! colorschemepicker#SynStack()
    echo map(synstack(line('.'),col('.')),'synIDattr(v:val, "name")')
endfunc

