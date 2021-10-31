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

if has('nvim')
"" ===== coc.nvim ===== {{{
"    Plug 'neoclide/coc.nvim', {'branch': 'release'}
"    LoadScript plugins/settings/coc.vim
""}}}
" ===== nvim-lsp ===== {{{
    Plug 'neovim/nvim-lspconfig'    " Collection of configurations for built-in LSP client
    Plug 'hrsh7th/cmp-nvim-lsp'     " LSP source for nvim-cmp
    Plug 'hrsh7th/nvim-cmp'         " Autocompletion plugin

    " For luasnip user
    Plug 'L3MON4D3/LuaSnip'         " Snippets plugin
    Plug 'saadparwaiz1/cmp_luasnip' " Snippets source for nvim-cmp

    " For vsnip user
    " Plug 'hrsh7th/cmp-vsnip'
    " Plug 'hrsh7th/vim-vsnip'

    " For ultisnips user.
    " Plug 'SirVer/ultisnips'
    " Plug 'quangnguyen30192/cmp-nvim-ultisnips'

    Plug 'hrsh7th/cmp-buffer'
"}}}
else
" ===== YouCompleteMe ===== {{{
    if g:os_is_linux
        Plug 'Valloric/YouCompleteMe', {
               \    'for': ['c', 'sh', 'cpp', 'vim', 'java', 'scala', 'python', 'go', 'json', 'javascript']
               \}
        LoadScript plugins/settings/YCM.vim
    endif
"}}}
endif

" ===== nvim-treesitter ===== {{{
if has('nvim')
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
endif
"}}}

" ===== ale ===== {{{
Plug 'w0rp/ale', {
\   'for': ['c', 'sh', 'cpp', 'vim', 'java', 'python', 'go', 'json', 'javascript']
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
 " has been set in `tmpfile.vim`
 " set updatetime=200
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

if has('nvim')
" ===== nvim-lsp ===== {{{
    LoadLuaScript plugins/settings/nvim-lspconfig.lua
    LoadLuaScript plugins/settings/nvim-cmp.lua
"}}}
" ===== nvim-treesitter ===== {{{
    LoadLuaScript plugins/settings/nvim-treesitter.lua
"}}}
endif

" 载入文件类型插件,为特定文件类型载入相关缩进文件
" filetype on                  " enable filetype detection (load ftdetect)
" filetype plugin on           " enable plugin (load ftplugin)
" filetype indent on           " enable indent (load indent)
