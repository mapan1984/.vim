set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin(g:home . '/' . 'bundles')

" ===== vim-airline ===== {{{
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
 let g:airline_theme='hybrid'
 " let g:airline_theme='gruvbox'
 let g:airline#extensions#ale#enabled = 1
 let g:airline#extensions#tagbar#enabled = 1
 let g:airline#extensions#ycm#enabled = 1

 let g:airline_powerline_fonts = 1

 if !exists('g:airline_symbols')
   let g:airline_symbols = {}
 endif
 "" unicode symbols
 let g:airline_left_sep = '»'
 let g:airline_left_sep = '▶'
 let g:airline_right_sep = '«'
 let g:airline_right_sep = '◀'
 "let g:airline_symbols.crypt = '🔒'
 "let g:airline_symbols.linenr = '☰'
 "let g:airline_symbols.linenr = '␊'
 "let g:airline_symbols.linenr = '␤'
 let g:airline_symbols.linenr = '¶'
 "let g:airline_symbols.maxlinenr = ''
 let g:airline_symbols.maxlinenr = '㏑'
 "let g:airline_symbols.branch = '⎇'
 let g:airline_symbols.paste = 'ρ'
 let g:airline_symbols.paste = 'Þ'
 "let g:airline_symbols.paste = '∥'
 let g:airline_symbols.spell = 'Ꞩ'
 let g:airline_symbols.notexists = 'Ɇ'
 let g:airline_symbols.whitespace = 'Ξ'
"}}}

" ===== lightline ===== {{{
"Plug 'itchyny/lightline.vim'
" let g:lightline = {
"   \   'colorscheme': 'wombat',
"   \   'active': {
"   \     'left':[ 
"   \       [ 'mode', 'paste' ],
"   \       [ 'gitbranch', 'readonly', 'filename', 'modified' ]
"   \     ]
"   \   },
"   \   'component': {
"   \     'lineinfo': ' %3l:%-2v',
"   \     'readonly': '%{&readonly?"":""}',
"   \     'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}'
"   \   },
"   \   'component_function': {
"   \     'gitbranch': 'fugitive#head',
"   \   }
"   \ }
" let g:lightline.separator = {
"   \   'left': '', 'right': ''
"   \}
" let g:lightline.subseparator = {
"   \   'left': '', 'right': ''
"   \}
" let g:lightline.tabline = {
"   \   'left': [ ['tabs'] ],
"   \   'right': [ ['close'] ]
"   \ }
"}}}

" ===== vim-buggerline ===== {{{
" Plug 'bling/vim-bufferline'
"}}}

" ===== undotree ===== {{{
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
 " if has("persistent_undo")
 "     set undodir=~/.undodir/
 "     set undofile
 " endif
"}}}

" ===== indentLine ===== {{{
Plug 'yggdroot/indentline'
 " {'on': 'IndentLinesToggle'}
 " let g:indentLine_enabled = 0
"}}}

" ===== vim color shcemes ===== {{{
" Plug 'morhetz/gruvbox'
"}}}

" ===== vim-indent-guides ===== {{{
Plug 'nathanaelkane/vim-indent-guides', {'on': 'IndentGuidesToggle'}
 " let g:indent_guides_enable_on_vim_startup=1
 let g:indent_guides_auto_colors=0
 let g:indent_guides_start_level=2
 let g:indent_guides_guide_size=1
 let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'vim',
                                        \ 'markdown', 'tex', ' ']
 " 快捷键i开/关缩进可视化
 " nnoremap <silent> <c-i> :IndentGuidesToggle<cr>
"}}}

" ===== vim-startify ===== {{{
"Plug 'mhinz/vim-startify'
"}}}

" ===== nerdtree ===== {{{
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
 nnoremap <c-b> :NERDTreeToggle<cr>
 " 设置相对行号
 "nnoremap <leader>nt :NERDTree<cr>:set rnu<cr>
 " Open NERDTree automatically when vim starts up if no files were specified
 autocmd StdinReadPre * let s:std_in=1
 autocmd VimEnter *
             \ if argc() == 0 && !exists("s:std_in") && exists(':NERDTreeToggle')
             \     | execute 'NERDTreeToggle'
             \ | endif
 " Close vim if the only window left open in a NERDTree
 autocmd bufenter *
             \ if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree())
             \     | q
             \ | endif
 " Store the bookmarks file
 "let NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks")
 "let NERDTreeShowBookmarks=1
 let g:NERDTreeShowFiles=1
 let g:NERDTreeShowHidden=1
 let g:NERDTreeIgnore=['\.git$', '\.gitignore$', '\.tags', '\.vscode$', '\.idea$', '.root',
                     \ '^__pycache__$', '\.pyc$', '\.venv$', '\.wenv',
                     \ '\.aux$', '\.log$', '\.out$', '\.pdf$', '\.gz$',
                     \ '^node_modules$', '\.tern-project$','^package-lock.json$',
                     \ '\.ycm_extra_conf.py$',
                     \ '^\.undo$','^\.tmp$', '^\.netrwhist$', '^\.cache$',
                     \ '\.sass-cache$',
                     \ '.eslintrc.js', '.prettierrc.js', '.flake8', '.tern-project']
 "let NERDTreeShowLineNumbers=1
 let g:NERDTreeWinPos=0
 " For mouse click in NERDTree
 let g:NERDTreeMouseMode=3

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "*",
    \ "Staged"    : "^",
    \ "Untracked" : "λ",
    \ "Renamed"   : ">",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "x",
    \ "Dirty"     : "✗",
    \ "Clean"     : "√",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
"}}}

" ======= Tags ======= {{{
" ===== taglist ===== {{{
"Plug 'vim-scripts/taglist.vim', {'on': 'TlistToggle'}
" set tags=./.tags;,.tags  " 从当前文件目录递归到根目录，或vim的当前目录(`:pwd`)
" "command! MakeTags !ctags -o .tags -R .
" nnoremap <silent> tl :TlistToggle<cr>
" let g:Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
" let g:Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
" let g:Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口
"}}}

" ===== tagbar ===== {{{
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
 set tags=./tags,./.tags;,.tags  " 从当前文件目录递归到根目录，或vim的当前目录(`:pwd`)
 "command! MakeTags !ctags -o .tags -R .
 nnoremap <silent> tl :TagbarToggle<cr>
 let g:tagbar_sort = 0     " 默认按位置排序
"}}}

" ===== vim-gutentags ===== {{{
Plug 'ludovicchabant/vim-gutentags'
"Plug 'skywind3000/gutentags_plus'
 " 调试
 "let g:gutentags_trace = 1
 " 碰到这些文件/目录名之前不断向上一级目录递归
 " (如果想避免生成ctags，在目录中加`.notags`文件)
 let g:gutentags_project_root = g:project_root_markers

 " 所生成的数据文件的名称
 let g:gutentags_ctags_tagfile = '.tags'
 " 将自动生成的 tags 文件全部放入 ~/.vim/.cache/tags 目录中，避免污染工程目录
 "let s:vim_cache_tags = expand('~/.vim/.cache/tags')
 "let g:gutentags_cache_dir = s:vim_cache_tags
 " 检测 ~/.cache/tags 不存在就新建
 "if !isdirectory(s:vim_cache_tags)
 "   silent! call mkdir(s:vim_cache_tags, 'p')
 "endif

 " 默认禁用自动生成
 let g:gutentags_modules = []
 " 如果有 ctags 可执行就允许动态生成 ctags 文件
 if executable('ctags')
     let g:gutentags_modules += ['ctags']
 endif
 " 如果有 gtags 可执行就允许动态生成 gtags 数据库
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

 " 配置 ctags 的参数
 let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
 let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
 let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
 " 如果使用 universal ctags 需要增加下面一行
 let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

 " 禁止 gutentags 自动链接 gtags 数据库
 "let g:gutentags_auto_add_gtags_cscope = 0
"}}}
"}}}

" ===== asyncrun.vim ===== {{{
Plug 'skywind3000/asyncrun.vim', { 'on': 'AsyncRun' }
 " 自动打开 quickfix window ，高度为 6
 let g:asyncrun_open = 6
 " 任务结束时候响铃提醒
 let g:asyncrun_bell = 1
 " 工程目录的标志
 let g:asyncrun_rootmarks = g:project_root_markers
 " 设置 F10 打开/关闭 Quickfix 窗口
 " nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
"}}}

" ===== vim-easymotion ===== {{{
Plug 'easymotion/vim-easymotion'
"}}}

" ===== vim-surround ===== {{{
Plug 'tpope/vim-surround'
"}}}

" ===== ultisnips ===== {{{
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
 let g:UltiSnipsExpandTrigger='<c-j>'
 let g:UltiSnipsJumpForwardTrigger='<c-j>'
 let g:UltiSnipsJumpBackwardTrigger='<c-k>'

 let g:UltiSnipsSnippetDirectories=['UltiSnips']

 let g:UltiSnipsEditSplit='vertical'

 let g:UltiSnipsUsePythonVersion = 3

 let g:UltiSnipsSnippetsDir = g:home . '/UltiSnips'

 let g:ultisnips_javascript = {
      \ 'keyword-spacing': 'always',
      \ 'semi': 'never',
      \ 'space-before-function-paren': 'always',
      \ }
"}}}

" ===== supertab ===== {{{
Plug 'ervandew/supertab'
"}}}

" ===== YouCompleteMe ===== {{{
function! BuildYCM(info)
  if a:info.status ==? 'installed' || a:info.force
    !./install.py --clang-completer --go-completer --js-completer --java-completer
  endif
endfunction
if g:os ==? 'win'
    set runtimepath+=C:/Users/mapan/.vim/.utils/ycm
    let g:ycm_server_python_interpreter = 'C:\Program Files (x86)\Python27\python.exe'
    " let g:ycm_python_binary_path = 'C:\Program Files\Python36\python.exe'
else
   " Plug 'Valloric/YouCompleteMe'
   Plug 'Valloric/YouCompleteMe', {
           \'for': ['c', 'sh', 'cpp', 'vim', 'java', 'python', 'go', 'json','javascript', 'javascript.jsx'],
           \'do': function('BuildYCM') }
endif
 "let g:ycm_key_invoke_completion = '<c-z>'
 nnoremap <F12> :YcmCompleter GoToDefinitionElseDeclaration<CR>
 ""nnoremap <S-F12> :YcmCompleter GoToReferences<CR>

 " Python config
 let g:ycm_python_binary_path = 'python3'
 let g:ycm_global_ycm_extra_conf = g:home .'/.utils/config/.ycm_extra_conf.py'
 " 屏蔽诊断信息
 let g:ycm_show_diagnostics_ui = 0
 " 不弹出函数原型的预览窗口
 set completeopt=menu,menuone
 let g:ycm_add_preview_to_completeopt = 0
 " Close preview window when the offered completion is accepted
 let g:ycm_autoclose_preview_window_after_completion=1

 let g:ycm_server_log_level = 'info'
 let g:ycm_min_num_identifier_candidate_chars = 2
 let g:ycm_collect_identifiers_from_comments_and_strings = 1
 let g:ycm_complete_in_strings=1
 " 输入两个字符后即进行语义补全
 let g:ycm_semantic_triggers =  {
        \ 'c,cpp,java,python,java,go,erlang,perl': ['re!\w{2}'],
        \ 'cs,lua,javascript,javascript.jsx,vim': ['re!\w{2}'],
        \ }
 let g:ycm_filetype_whitelist = {
             \ 'c': 1,
             \ 'go': 1,
             \ 'sh': 1,
             \ 'cpp': 1,
             \ 'vim': 1,
             \ 'java': 1,
             \ 'python': 1,
             \ 'javascript': 1,
             \ 'javascript.jsx': 1,
             \ }

 " gopath
 if !empty($GOPATH) && len(split($GOPATH, ":")) > 1
    let g:ycm_gocode_binary_path = split($GOPATH, ":")[0] . "/bin/gocode"
    let g:ycm_godef_binary_path = split($GOPATH, ":")[0] . "/bin/godef"
 elseif !empty($GOPATH) && len(split($GOPATH, ":")) == 1
    let g:ycm_gocode_binary_path = $GOPATH . "/bin/gocode"
    let g:ycm_godef_binary_path = $GOPATH . "/bin/godef"
 endif
"}}}

" ===== vim-snipmate ===== {{{
"Plug 'marcweber/vim-addon-mw-utils'
"Plug 'tomtom/tlib_vim'
"Plug 'garbas/vim-snipmate'
"Plug 'honza/vim-snippets'
" imap <c-j> <Plug>snipMateNextOrTrigger
" smap <c-j> <Plug>snipMateNextOrTrigger
"}}}

" ===== ale ===== {{{
Plug 'w0rp/ale'
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
"}}}

" ===== Emmet-vim ===== {{{
Plug 'mattn/emmet-vim'
 " Enable just for html/css
 let g:user_emmet_install_global = 0
 autocmd FileType html,htmljinja,css EmmetInstall
 autocmd FileType html,htmljinja,css imap <buffer> <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
"}}}

" ===== LeaderF  ===== {{{
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
 let g:Lf_ShortcutF = '<c-p>'
 let g:Lf_ShortcutB = '<m-b>'
 noremap <m-m> :LeaderfMru<cr>
 noremap <m-f> :LeaderfFunction<cr>
 noremap <m-b> :LeaderfBuffer<cr>
 noremap <m-t> :LeaderfTag<cr>

 let g:Lf_StlColorscheme = 'powerline'
 let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

 let g:Lf_RootMarkers = g:project_root_markers
 let g:Lf_WorkingDirectoryMode = 'Ac'
 let g:Lf_WindowHeight = 0.30
 let g:Lf_ShowRelativePath = 0
 let g:Lf_HideHelp = 1
 let g:Lf_PreviewResult = {'Function': 0, 'Colorscheme':1}

 let g:Lf_NormalMap = {
    \ 'File':           [['<ESC>', ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
    \ 'Buffer':         [['<ESC>', ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
    \ 'Mru':            [['<ESC>', ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
    \ 'Tag':            [['<ESC>', ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
    \ 'Function':       [['<ESC>', ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
    \ 'Colorscheme':    [['<ESC>', ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
    \ }

 let s:vim_cache_lf = expand('~/.vim/.cache')
 let g:Lf_CacheDirectory = s:vim_cache_lf
 if !isdirectory(s:vim_cache_lf)
    silent! call mkdir(s:vim_cache_lf, 'p')
 endif
"}}}

" ===== ctrlp ===== {{{
""Plug 'ctrlpvim/ctrlp.vim'
 "let g:ctrlp_map = '<c-p>'
 "let g:ctrlp_cmd = 'CtrlP'
 "" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore"
 "let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
 "" Ag is fast enough that CtrlP doesn't need to cache
 "let g:ctrlp_use_caching = 0

 "let g:ctrlp_working_path_mode = 'ra'

 "Because use `ctrlp_user_command`，ignore config are not used by CtrlP
 " let g:ctrlp_custom_ignore = {
 "   \ 'dir':  '\v[\/](node_modules|log|tmp)|(\.(git|svn|vscode))$',
 "   \ 'file': '\v\.(exe|so|dll|dat)$',
 "   \ }
 " set wildignore+=*/tmp/*,*\\tmp\\*,*.so,*.swp,*.zip,*.exe,*/.sass-cache/*,*/node_modules/*
"}}}

" ===== ag.vim ===== {{{
if executable('ag')
    Plug 'rking/ag.vim', {'on': 'Ag'}
     " Use ag over grep
     set grepprg=ag\ --nogroup\ --nocolor
     let g:ag_prg='ag --vimgrep --smart-case'
     let g:ag_highlight=1
     let g:ag_working_path_mode='r'
     " Bind `K` to grep word under cursor
     "nnoremap K :grep! "\b<C-R><C-W>\b" <CR>:cw<CR>
endif
"}}}

" ======= Git ======= {{{
" ===== vim-fugitve ===== {{{
Plug 'tpope/vim-fugitive'
"}}}

" ===== vim-gitgutter ===== {{{
Plug 'airblade/vim-gitgutter'
 set updatetime=200
"}}}

" ===== gv.vim ===== {{{
Plug 'junegunn/gv.vim', {'on': 'GV'}
"}}}

" ===== vim-signify ===== {{{
""Plug 'mhinz/vim-signify'
"}}}
"}}}

" ===== Ci ===== {{{
Plug 'mapan1984/Ci', {'branch': 'forme'}
"}}}

" ===== pangu.vim ===== {{{
Plug 'hotoo/pangu.vim', {'for': 'markdown'}
"}}}

" ===== vim-markdown ===== {{{
Plug 'godlygeek/tabular', {'for': 'markdown'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
 let g:vim_markdown_folding_disabled = 1
 let g:vim_markdown_folding_level = 6
 let g:vim_markdown_no_default_key_mappings = 1
 let g:vim_markdown_toc_autofit = 1
 let g:vim_markdown_emphasis_multiline = 0
 let g:vim_markdown_conceal = 0
 let g:vim_markdown_frontmatter = 1
 let g:vim_markdown_new_list_item_indent = 2
"}}}

" ===== vim-jinja ===== {{{
Plug 'Glench/Vim-Jinja2-Syntax', {'for': ['html', 'jinja']}
"}}}

" ===== vim-javascript ===== {{{
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'mxw/vim-jsx', {'for': ['javascript', 'javascript.jsx']}
 let g:jsx_ext_required = 1
"}}}

" ===== vim-json ===== {{{
"Plug 'elzr/vim-json', {'for': 'json'}
" let g:vim_json_syntax_conceal = 0
" let g:vim_json_warnings=0
"}}}

" ===== vim-python-pep8-indent ===== {{{
Plug 'hynek/vim-python-pep8-indent', {'for': 'python'}
"}}}

" ===== vim-systemd-syntax ===== {{{
Plug 'Matt-Deacalion/vim-systemd-syntax'
"}}}

" ===== leafgarland/typescript-vim ===== {{{
Plug 'leafgarland/typescript-vim', {'for': 'typescript'}
"}}}

call plug#end()

" 载入文件类型插件,为特定文件类型载入相关缩进文件
filetype on                  " enable filetype detection
filetype plugin on           " enable plugin (load ftplugin)
filetype indent on           " enable indent (load indent)
