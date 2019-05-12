" 调试 gutentags
"let g:gutentags_trace = 1

" 碰到这些文件/目录名之前不断向上一级目录递归
" (如果想避免生成ctags，在目录中加`.notags`文件)
let g:gutentags_project_root = g:project_root_markers

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.vim/.cache/tags 目录中，避免污染工程目录
let s:vim_cache_tags = expand('~/.vim/.cache/tags')
let g:gutentags_cache_dir = s:vim_cache_tags
" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_cache_tags)
   silent! call mkdir(s:vim_cache_tags, 'p')
endif

" 默认禁用自动生成
let g:gutentags_modules = []
" 如果有 ctags 可执行就允许动态生成 ctags 文件
if executable('ctags')
    let g:gutentags_modules += ['ctags']
endif

" gtags 指定分析器和配置
"let $GTAGSLABEL = 'native-pygments'
"let $GTAGSCONF = g:home . '/.utils/config/gtags.conf'
"" 如果有 gtags 可执行就允许动态生成 gtags 数据库
"if executable('gtags') && executable('gtags-cscope')
"    let g:gutentags_modules += ['gtags_cscope']
"endif

" 忽略未进入版本控制的文件
"let g:gutentags_file_list_command = 'rg --files'
let g:gutentags_file_list_command = {
    \ 'markers': {
        \ '.git': 'git ls-files',
        \ '.hg': 'hg files',
        \ },
    \ }
let g:gutentags_ctags_exclude = ["*.min.js", "*.min.css", "build", "vendor", ".git", "node_modules", "*.vim/bundles/*"]

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extras=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
" 如果使用 universal ctags 需要增加下面一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁止 gutentags 自动链接 gtags 数据库
"let g:gutentags_auto_add_gtags_cscope = 0
