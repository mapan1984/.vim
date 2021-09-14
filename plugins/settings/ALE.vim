" 编辑不同文件类型需要的语法检查器
let g:ale_linters_explicit = 1
let g:ale_linters = {
\   'javascript': ['eslint', 'prettier'],
\   'python': ['flake8'],
\   'c': ['gcc'],
\   'cpp': ['gcc'],
\   'go': ['go build', 'gofmt'],
\   'vim': ['vint'],
\   'php': ['php -l'],
\   'text': ['textlint', 'write-good', 'languagetool']
\}
"\   'sh': ['shellcheck'],

" 如果没有 gcc 只有 clang 时（FreeBSD）
if executable('gcc') == 0 && executable('clang')
    let g:ale_linters.c += ['clang']
    let g:ale_linters.cpp += ['clang']
endif

" Set this variable to 1 to fix files when you save them
" let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'python': ['flake8'],
\   'c': ['gcc'],
\   'cpp': ['gcc'],
\   'go': ['go build', 'gofmt'],
\}

" Enable completion where available
"let g:ale_completion_enabled = 1

" 设定延迟和提示信息
let g:ale_completion_delay = 200
let g:ale_echo_delay = 20
let g:ale_lint_delay = 200
"let g:ale_echo_msg_error_str = 'E'
"let g:ale_echo_msg_warning_str = 'W'
" let g:ale_echo_msg_format = '[%linter%] [%severity%] %code: %%s'
let g:ale_echo_msg_format = '[%linter%] %code: %%s'

" 设定检测的时机：normal模式文字改变，或者离开insert模式
"                 禁用默认INSERT模式下改变文字也触发的设置
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1

" 跳转到错误
nmap <silent> [e <Plug>(ale_previous_wrap)
nmap <silent> ]e <Plug>(ale_next_wrap)

" Keep a sign gutter open
" let g:ale_sign_column_always = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'

" Use quickfix list instead of the loclist
" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 1

" Show when code contains warnings or errors"
"let g:ale_open_list = 1
" let g:ale_keep_list_window_open = 1
" 如果只剩下LocationList则关闭LocationList
autocmd QuitPre * if empty(&bt) | lclose | endif

" Show 5 lines of errors (default: 10)
"let g:ale_list_window_size = 5

" Change the signs ALE uses
let g:ale_sign_error = 'x>'
let g:ale_sign_warning = '!>'
" let g:ale_sign_error = "◉"
" let g:ale_sign_warning = "•"
" let g:ale_sign_error = '✘'
" let g:ale_sign_warning = '⚠'
