" https://www.reddit.com/r/vim/comments/49n1ay/are_set_nocompatible_and_filetype_off_still/
" set nocompatible              " be iMproved, required
" filetype off                  " required

" Make sure Vim-Plug is installed
if empty(glob(g:home . "/autoload/plug.vim"))
    execute '!curl -fLo ' . g:home . '/autoload/plug.vim --create-dirs'
    \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin(g:home . '/.plugins')

" ===== vim-airline ===== {{{
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
LoadScript plugins/settings/vim-airline.vim
"}}}

" ===== nerdtree ===== {{{
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
LoadScript plugins/settings/NERDTree.vim
"}}}

" ===== vim-gutentags ===== {{{
" 1. 确定文件所在的工程目录（从当前文件向上递归查找`.git`, `.project`等标志）
" 2. 同一个工程下所有的文件改动，自动增量更新对应工程的.tags文件
Plug 'ludovicchabant/vim-gutentags'
LoadScript plugins/settings/gutentags.vim
"}}}


if g:editor ==? 'nvim'
" ===== coc.nvim ===== {{{
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    LoadScript plugins/settings/coc.vim
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
        LoadScript plugins/settings/YCM.vim
    endif
"}}}
endif

" ===== ale ===== {{{
Plug 'w0rp/ale', {
\   'for': ['c', 'sh', 'cpp', 'vim', 'java', 'python', 'go', 'json','javascript', 'javascript.jsx']
\ }
LoadScript plugins/settings/ALE.vim
"}}}

" ===== LeaderF  ===== {{{
if has('python3')
    Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
    LoadScript plugins/settings/LeaderF.vim
endif
"}}}

" ===== ag.vim ===== {{{
if executable('ag')
    Plug 'rking/ag.vim', {'on': 'Ag'}
    LoadScript plugins/settings/ag.vim
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

" ===== Ci ===== {{{
Plug 'mapan1984/Ci', {'branch': 'forme'}
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

" ===== vim-systemd-syntax ===== {{{
Plug 'Matt-Deacalion/vim-systemd-syntax'
"}}}

call plug#end()

" 载入文件类型插件,为特定文件类型载入相关缩进文件
" filetype on                  " enable filetype detection (load ftdetect)
" filetype plugin on           " enable plugin (load ftplugin)
" filetype indent on           " enable indent (load indent)
