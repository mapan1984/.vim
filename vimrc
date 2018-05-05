" ========= 提前的全局配置 ========= {{{
source ~/.vim/.utils/fix-alt-map.vim
"}}}

" ========= Plugin ========= {{{
set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/bundle')

" ===== solarized ===== {{{
Plug 'altercation/vim-colors-solarized'
 let g:solarized_termtrans  = 1
 let g:solarized_termcolors = 256
 let g:solarized_contrast   = "high"
 let g:solarized_visibility = "high"
"}}}

" ===== vim-airline ===== {{{
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
 set laststatus=2     " 总是显示状态行
 let g:airline_theme='solarized'
 let g:airline#extensions#ale#enabled = 1
 let g:airline#extensions#tagbar#enabled = 1
 let g:airline#extensions#ycm#enabled = 1
"}}}

" ===== vim-indent-guides ===== {{{
Plug 'nathanaelkane/vim-indent-guides'
 " let g:indent_guides_enable_on_vim_startup=1
 let g:indent_guides_auto_colors=0
 let g:indent_guides_start_level=2
 let g:indent_guides_guide_size=1
 let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'vim',
                                        \ 'markdown', 'tex', ' ']
 autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
 autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
 " 快捷键i开/关缩进可视化
 " nnoremap <silent> <c-i> :IndentGuidesToggle<cr>
"}}}

" ===== nerdtree ===== {{{
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
 nnoremap <c-b> :NERDTreeToggle<cr>
 " 设置相对行号
 "nnoremap <leader>nt :NERDTree<cr>:set rnu<cr>
 " open a NERDTree utomatically when vim starts up if no files were specified
 autocmd StdinReadPre * let s:std_in=1
 autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
 " close vim if the only window left open in a NERDTree
 autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
 " Store the bookmarks file
 "let NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks")
 "let NERDTreeShowBookmarks=1
 let g:NERDTreeShowFiles=1
 let g:NERDTreeShowHidden=1
 let g:NERDTreeIgnore=['\.git$', '\.gitignore$', '.tags', '\.vscode$', '\.idea$',
                     \ '^__pycache__$', '\.pyc$', '\.venv$', '\.wenv',
                     \ '\.aux$', '\.log$', '\.out$', '\.pdf$', '\.gz$',
                     \ '^node_modules$', '\.tern-project$',
                     \ '\.ycm_extra_conf.py$',
                     \ '^\.undo$','^\.tmp$', '^\.netrwhist$', '^\.cache$',
                     \ '\.sass-cache$',
                     \ '.eslintrc.js', '.flake8', '.tern-project']
 "let NERDTreeShowLineNumbers=1
 let g:NERDTreeWinPos=0
 " For mouse click in NERDTree
 let g:NERDTreeMouseMode=3
"}}}

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
 set tags=./.tags;,.tags  " 从当前文件目录递归到根目录，或vim的当前目录(`:pwd`)
 "command! MakeTags !ctags -o .tags -R .
 nnoremap <silent> tl :TagbarToggle<cr>
"}}}

" ===== vim-gutentags ===== {{{
Plug 'ludovicchabant/vim-gutentags'
 " gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
 let g:gutentags_project_root = ['.root', '.vscode', '.git', 'Markfile', '.venv', 'package.json']
 " 所生成的数据文件的名称
 let g:gutentags_ctags_tagfile = '.tags'
 " 将自动生成的 tags 文件全部放入 ~/.vim/.cache/tags 目录中，避免污染工程目录
 let s:vim_tags = expand('~/.vim/.cache/tags')
 let g:gutentags_cache_dir = s:vim_tags
 " 配置 ctags 的参数
 "let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
 "let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
 "let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
 " 检测 ~/.cache/tags 不存在就新建
 if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
 endif
"}}}

" ===== asyncrun.vim ===== {{{
Plug 'skywind3000/asyncrun.vim'
 " 自动打开 quickfix window ，高度为 6
 let g:asyncrun_open = 6
 " 任务结束时候响铃提醒
 let g:asyncrun_bell = 1
 " 工程目录的标志
 let g:asyncrun_rootmarks = ['.root', '.git', '.vscode', 'Makefile', '.venv']
 " 设置 F10 打开/关闭 Quickfix 窗口
 nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
"}}}

" ===== supertab ===== {{{
Plug 'ervandew/supertab'
"}}}

" ===== YouCompleteMe ===== {{{
function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.py --clang-completer --go-completer --js-completer
  endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'for': ['c', 'cpp', 'python', 'go', 'javascript'], 'do': function('BuildYCM') }
 "let g:ycm_key_invoke_completion = '<c-z>'
 nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>

 " Python config
 let g:ycm_python_binary_path = 'python3'
 let g:ycm_global_ycm_extra_conf='~/.vim/.utils/.ycm_extra_conf.py'
 " 屏蔽诊断信息
 "let g:ycm_show_diagnostics_ui = 0
 " 不弹出函数原型的预览窗口
 set completeopt=menu,menuone
 let g:ycm_add_preview_to_completeopt = 0
 " Close preview window when the offered completion is accepted
 "let g:ycm_autoclose_preview_window_after_completion=1
 let g:ycm_server_log_level = 'info'
 let g:ycm_min_num_identifier_candidate_chars = 2
 let g:ycm_collect_identifiers_from_comments_and_strings = 1
 let g:ycm_complete_in_strings=1
 " 输入两个字符后即进行语义补全"
 let g:ycm_semantic_triggers =  {
             \ 'c,cpp,go,python,javascript': ['re!\w{2}'],
             \ }
 let g:ycm_filetype_whitelist = {
             \ "c": 1,
             \ "go": 1,
             \ "cpp": 1,
             \ "python": 1,
             \ "javascript": 1,
             \ }
"}}}

" ===== ale ===== {{{
Plug 'w0rp/ale'
 let g:ale_linters = {
 \   'javascript': ['eslint'],
 \   'python': ['flake8'],
 \}
 let g:ale_linters_explicit = 1
 let g:ale_completion_delay = 500
 let g:ale_echo_delay = 20
 let g:ale_lint_delay = 500
 let g:ale_echo_msg_format = '[%linter%] %code: %%s'
 let g:ale_lint_on_text_changed = 'normal'
 let g:ale_lint_on_insert_leave = 1

 nmap <silent> [e <Plug>(ale_previous_wrap)
 nmap <silent> ]e <Plug>(ale_next_wrap)


 ""let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
 ""let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
 ""let g:ale_c_cppcheck_options = ''
 ""let g:ale_cpp_cppcheck_options = ''
 ""let g:ale_sign_error = "\ue009\ue009"
 ""hi! clear SpellBad
 ""hi! clear SpellCap
 ""hi! clear SpellRare
 ""hi! SpellBad gui=undercurl guisp=red
 ""hi! SpellCap gui=undercurl guisp=blue
 ""hi! SpellRare gui=undercurl guisp=magenta
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
 let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

 let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
 let g:Lf_WorkingDirectoryMode = 'Ac'
 let g:Lf_WindowHeight = 0.30
 let g:Lf_CacheDirectory = expand('~/.vim/.cache')
 let g:Lf_ShowRelativePath = 0
 let g:Lf_HideHelp = 1
 let g:Lf_StlColorscheme = 'powerline'

 let g:Lf_NormalMap = {
    \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>'],
    \            ["<F6>", ':exec g:Lf_py "fileExplManager.quit()"<CR>'] ],
    \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>'],
    \            ["<F6>", ':exec g:Lf_py "bufExplManager.quit()"<CR>'] ],
    \ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
    \ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
    \ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
    \ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
    \ }
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
Plug 'rking/ag.vim'
 " Use ag over grep
 set grepprg=ag\ --nogroup\ --nocolor
 let g:ag_prg="ag --vimgrep --smart-case"
 let g:ag_highlight=1
 let g:ag_working_path_mode="r"
 " Bind `K` to grep word under cursor
 "nnoremap K :grep! "\b<C-R><C-W>\b" <CR>:cw<CR>
"}}}

" ===== vim-fugitve ===== {{{
Plug 'tpope/vim-fugitive'
"}}}

" ===== vim-gitgutter ===== {{{
Plug 'airblade/vim-gitgutter'
 set updatetime=250
"}}}

" ===== vim-signify ===== {{{
""Plug 'mhinz/vim-signify'
"}}}

" ===== Ci ===== {{{
Plug 'mapan1984/Ci', {'branch': 'forme'}
"}}}

" ===== vim-markdown ===== {{{
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
 let g:vim_markdown_folding_disabled = 1
 let g:vim_markdown_folding_level = 6
 let g:vim_markdown_no_default_key_mappings = 1
 let g:vim_markdown_toc_autofit = 1
 let g:vim_markdown_emphasis_multiline = 0
 let g:vim_markdown_conceal = 0
 let g:vim_markdown_frontmatter = 1
 let g:vim_markdown_new_list_item_indent = 2
"}}}

" ===== vim-javascript ===== {{{
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
"}}}

" ===== vim-python-pep8-indent ===== {{{
Plug 'hynek/vim-python-pep8-indent'
"}}}


call plug#end()

" 载入文件类型插件,为特定文件类型载入相关缩进文件
filetype plugin indent on    " required enables filetype plugin
                             "          enables filetype indent
" }}}

" ===== Other Settings ===== {{{
filetype on                     " enables filetype detection
syntax enable                   " 开启语法高亮功能
syntax on                       " 允许用指定语法高亮配色方案替换默认方案
set history=1000                " 历史记录数
set wildmenu                    " vim自身命令行模式智能补全
set autoread                    " 文件在Vim之外修改过，自动重新读入
set confirm                     " 在处理未保存或只读文件的时候，弹出确认
set encoding=utf-8              " Vim内部文件(寄存器、缓冲区...)的编码为 UTF-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1 " 自动判断编码，依次尝试以下顺序
" set helplang=cn                 " 帮助系统设置为中文
" set iskeyword+=%,&,-            " set the keywords将-连接符也设置为单词
" set spell spelllang=en_us       " spell checking
set whichwrap=b,s,<,>,[,]       " 让<BS>，<Space>，<Left>, <Right>遇到行首行尾时自动移到下一行
set backspace=indent,eol,start  " 使回格键（backspace）正常处理indent, eol, start等
"set mouse=a                     " enable using the mouse if terminal emulator
set mousehide                   " 在输入时隐藏鼠标指针
" set clipboard=unnamed

let mapleader=","               " 设置leader键
let maplocalleader="\<Space>"   " localleader
"}}}

" ===== UI ===== {{{
set background=dark             " 可选light/dark
colorscheme solarized
set number                      " 显示行号
set numberwidth=3               " 行号栏的宽度
" 当前行高亮只在当前窗口并且不处于插入模式下生效
"set cursorline                  " 设置光标高亮显示
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline
set nowrap                      " 默认禁止自动换行
set colorcolumn=80              " 彩色显示第80行
set scrolloff=10                " 光标移动到buffer的顶部和底部时保持10行距离
set foldenable                  " 开启代码折叠
set foldmethod=syntax           " 语法高亮项目指定折叠
set hidden                      " hide buffers instead of closing them
set laststatus=2                " 总是显示状态行
set showcmd                     " 显示输入命令在状态栏
set showmode                    " show the mode of vim
set ruler                       " 显示光标位置的行号和列号
set list listchars=tab:→\ ,trail:•
"}}}

" ===== 临时文件 ===== {{{
" 如果文件夹不存在，则新建文件夹
if !isdirectory($HOME.'/.vim/.tmp') && exists('*mkdir')
  call mkdir($HOME.'/.vim/.tmp')
  call mkdir($HOME.'/.vim/.tmp/backup')
  call mkdir($HOME.'/.vim/.tmp/swap')
  call mkdir($HOME.'/.vim/.tmp/undo')
  call mkdir($HOME.'/.vim/.tmp/info')
endif

" 备份文件
"set nobackup                " 禁止生成备份文件
set backup
set backupdir   =$HOME/.vim/.tmp/backup/
set backupext   =-vimbackup
set backupskip  =
" 交换文件
"set noswapfile             " 禁用交换文件
set directory   =$HOME/.vim/.tmp/swap/
set updatecount =100
" 撤销文件
set undolevels=1000             " use many much levels of undo
set undofile
set undodir     =$HOME/.vim/.tmp/undo/
" viminfo 文件
set viminfo     ='100,n$HOME/.vim/.tmp/info/viminfo
"}}}

" ===== Searching ===== {{{
set hlsearch                    " highlight the words match the search pattern
set incsearch                   " show the pattern as it was typed so far
set ignorecase                  " 设置大小写敏感和聪明感知(小写忽略大小写，包含大写字母则完全匹配)
set smartcase
set showmatch                   " jump to the matching bracket
" 取消搜索高亮
" noremap <bs> :nohl<cr>
noremap <c-h> :nohl<cr>

" 在当前文件下寻找光标下的词，在quickfix中显示
"nnoremap <leader>g :execute "grep! -R " . shellescape(expand("<cWORD>")) . " %"<cr>:copen<cr>

" Open quickfix window after any grep invocation
autocmd QuickFixCmdPost *grep* cwindow
"}}}

" 打文件后开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写 {{{
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
"}}}

" 修改.vimrc后自动载入配置文件不需要重启
"autocmd! bufwritepost $MYVIMRC source $MYVIMRC

