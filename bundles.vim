set nocompatible              " be iMproved, required
filetype off                  " required

" Make sure Vim-Plug is installed
if empty(glob(g:home . "/autoload/plug.vim"))
    execute '!curl -fLo ' . g:home . '/autoload/plug.vim'
    \ 'https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin(g:home . '/.bundles')

" if utils#GetRAND() % 2 == 0
if utils#Rand() % 2 == 0
    " ===== vim-airline ===== {{{
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    LoadScript settings/AirLine.vim
    "}}}
else
    " ===== lightline ===== {{{
    Plug 'itchyny/lightline.vim'
    Plug 'maximbaz/lightline-ale'
    LoadScript settings/LightLine.vim
    "}}}
endif

" ===== vim-which-key ===== {{{
" Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
" LoadScript settings/WhichKey.vim
"}}}

" ===== undotree ===== {{{
if has("persistent_undo")
  Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
endif
"}}}

" ===== indentLine ===== {{{
Plug 'yggdroot/indentline', {
           \'for': ['c', 'sh', 'cpp', 'vim', 'java', 'python', 'go', 'json','javascript', 'javascript.jsx'],
           \'on': 'IndentLinesToggle'}
 let g:indentLine_enabled = 0
"}}}

" ===== vim color shcemes ===== {{{
" Plug 'morhetz/gruvbox'
"}}}

" ===== vim-startify ===== {{{
"Plug 'mhinz/vim-startify'
"}}}

" ===== nerdtree ===== {{{
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
LoadScript settings/NERDTree.vim
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
 " set tags=./tags,./.tags;,.tags  " 从当前文件目录递归到根目录，或vim的当前目录(`:pwd`)
 set tags=./.tags;,.tags  " 从(`./.tags;`)当前文件目录递归到根目录，或(`.tags`)vim的当前目录(`:pwd`)
 " command! MakeTags !ctags -o .tags -R .
 nnoremap <silent> tl :TagbarToggle<cr>
 let g:tagbar_sort = 0     " 默认按位置排序
"}}}

" ===== vim-gutentags ===== {{{
" 1. 确定文件所在的工程目录（从当前文件向上递归查找`.git`, `.project`等标志）
" 2. 同一个工程下所有的文件改动，自动增量更新对应工程的.tags文件
if (has('job') || (has('nvim') && exists('*jobwait')))
    Plug 'ludovicchabant/vim-gutentags'
    LoadScript settings/gutentags.vim
endif
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
" Plug 'easymotion/vim-easymotion'
"}}}

" ===== vim-surround ===== {{{
Plug 'tpope/vim-surround'
"}}}

" ===== ultisnips ===== {{{
if has('python3')
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    LoadScript settings/snippets.vim
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

" ===== supertab ===== {{{
" Plug 'ervandew/supertab'
"}}}

if g:editor ==? 'nvim'
" ===== coc.nvim ===== {{{
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    LoadScript settings/coc.vim
"}}}
else
" ===== YouCompleteMe ===== {{{
    if g:os ==? 'linux'
        function! BuildYCM(info)
          if a:info.status ==? 'installed' || a:info.force
            "!./install.py --clang-completer --go-completer --js-completer --java-completer
            !./install.py --clang-completer --go-completer --ts-completer  --java-completer
          endif
        endfunction

        " Plug 'Valloric/YouCompleteMe'
        Plug 'Valloric/YouCompleteMe', {
               \'for': ['c', 'sh', 'cpp', 'vim', 'java', 'scala', 'python', 'go', 'json','javascript', 'javascript.jsx'],
               \'do': function('BuildYCM')
               \}
        LoadScript settings/YCM.vim
    endif
"}}}
endif

" ===== vim-lsp ===== {{{
" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'
" LoadScript settings/vim-lsp.vim
" }}}

" ===== joom/latex-unicoder.vim ===== {{{
" Plug 'joom/latex-unicoder.vim'
"  let g:unicoder_cancel_normal = 1
"  let g:unicoder_cancel_insert = 1
"  let g:unicoder_cancel_visual = 1
"  nnoremap <C-i> :call unicoder#start(0)<CR>
"  inoremap <C-i> <Esc>:call unicoder#start(1)<CR>
"  vnoremap <C-i> :<C-u>call unicoder#selection()<CR>
"}}}

" ===== ale ===== {{{
Plug 'w0rp/ale', {
\   'for': ['c', 'sh', 'cpp', 'vim', 'java', 'python', 'go', 'json','javascript', 'javascript.jsx']
\ }
LoadScript settings/ALE.vim
"}}}

" ===== Emmet-vim ===== {{{
Plug 'mattn/emmet-vim'
LoadScript settings/emmet.vim
"}}}

" ===== LeaderF  ===== {{{
if has('python3')
    Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
    LoadScript settings/LeaderF.vim
endif
"}}}

" ===== ctrlp ===== {{{
" Plug 'ctrlpvim/ctrlp.vim'
" LoadScript settings/ctrlp.vim
"}}}

" ===== ag.vim ===== {{{
if executable('ag')
    Plug 'rking/ag.vim', {'on': 'Ag'}
    LoadScript settings/ag.vim
endif
"}}}

" ===== vim-fugitve ===== {{{
Plug 'tpope/vim-fugitive'
"}}}

" ===== vim-gitgutter ===== {{{
Plug 'airblade/vim-gitgutter'
 set updatetime=200
 let g:gitgutter_max_signs = 1000
"}}}

" ===== gv.vim ===== {{{
Plug 'junegunn/gv.vim', {'on': 'GV'}
"}}}

" ===== vim-signify ===== {{{
""Plug 'mhinz/vim-signify'
"}}}

" ===== Ci ===== {{{
Plug 'mapan1984/Ci', {'branch': 'forme'}
"}}}

" ===== pangu.vim ===== {{{
" Plug 'hotoo/pangu.vim', {'for': 'markdown'}
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
 let g:vim_markdown_conceal = 0
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
Plug 'elzr/vim-json', {'for': 'json'}
 let g:vim_json_syntax_conceal = 0
 let g:vim_json_warnings=0
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
