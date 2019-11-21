" ===== Default Indentation ===== {{{
set autoindent                  " 开启新行，从当前行负责缩进距离
set smartindent                 " 开启新行时使用智能自动缩进
set expandtab                   " 使用空格代替制表符
set tabstop=4                   " 插入模式下Tab键的宽度
set shiftwidth=4                " (自动) 缩进每一步使用的空白数目。用于 |'cindent'|、|>>|、|<<| 等(自动) 缩进每一步使用的空白数目。用于 |'cindent'|、|>>|、|<<| 等
set softtabstop=4               " 允许<Tab>和<Space>混合输入
set smarttab                    " 行首的 <Tab> 根据 'shiftwidth' 插入/删除空白
"}}}

" ========= \t 将tab替换为空格 ========== {{{
"inoremap \t <esc>:call format#RemoveTabs()<cr>
nnoremap \t :call format#RemoveTabs()<cr>
"}}}

" ========= \b 去除所有尾部空白(blank) ========= {{{
"inoremap \b <esc>:call format#StripTrailingBlank()<cr>
nnoremap \b :call format#StripTrailingBlank()<cr>
"autocmd BufWritePre * call format#RemoveTrailingWhitespace()
"}}}

" Use <tab> and <shift-tab> to indent {{{
""vnoremap <tab> >gv
""vnoremap <s-tab> <gv
xnoremap > >gv
xnoremap < <gv
"}}}

" ======== 插入文件头 ======= {{{
nnoremap <localleader>hd :call format#AutoSetFileHead()<CR>
"}}}

" clang-format {{{
augroup clang-format
  au!
  au FileType c,c++ nnoremap <c-l> :pyf ~/.vim/.utils/clang-format.py<cr>
  au FileType c,c++ inoremap <c-l> <esc>:pyf ~/.vim/.utils/clang-format.py<cr>
augroup END

"}}}

" js-format {{{
augroup js-format
    au!
    au FileType javascript nnoremap <c-l> :!prettier --write %<cr>
    au FileType javascript inoremap <c-l> <esc>:!prettier --write %<cr>
    "au FileType javascript map <c-k> :AsyncRun eslint %<cr>
    "au FileType javascript imap <c-k> <esc>:AsyncRun eslint %<cr>
augroup END

"function! Prettier()
"    let l:start = line("'<")
"    let l:end = line("'>")
"    execute 'normal! :!prettier --range-start ' . l:start . ' --range-end ' . l:end . ' %'
"endfunction
"xnoremap <c-l> :call Prettier()<cr>
"}}}

" py-format {{{
augroup py-format
    au!
    au FileType python nnoremap <c-l> :!yapf --style=pep8 -i %<cr>
    au FileType python inoremap <c-l> <esc>:!yapf  --style=pep8 -i %<cr>
    "au FileType javascript map <c-k> :AsyncRun eslint %<cr>
    "au FileType javascript imap <c-k> <esc>:AsyncRun eslint %<cr>
augroup END
"}}}

" js-beautify-format html,css,json {{{
function! s:JsBeautify()
    let cmd = [
        \ '!js-beautify',
        \ '-r'
        \ ]

    let l:ft = "js"
    if &filetype == "html"
        let l:ft = "html"
    elseif &filetype == "css"
        let l:ft = "css"
    endif

    let cmd = add(cmd, '--type ' . l:ft . ' %')

    " echo join(cmd)
    execute join(cmd)
endfunction

" json 格式化
com! FormatJSONPy2Utf8 %!python -c "import json, sys, collections; print json.dumps(json.load(sys.stdin, object_pairs_hook=collections.OrderedDict), ensure_ascii=False, indent=2)"
com! FormatJSON %!python -m json.tool

augroup jsbeautify
    autocmd!
    autocmd FileType html,css,js,javascript,json
        \ command! -bar -nargs=0 -buffer JsBeautify call s:JsBeautify()
augroup END
"}}}

"set fileformats=dos
"set fileformats=unix
