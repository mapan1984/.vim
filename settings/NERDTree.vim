nnoremap <c-b> :NERDTreeToggle<cr>
" noremap ,v :NERDTreeFind<cr>

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
let g:NERDTreeIgnore=[
\     '\.git$', '\.gitignore$', '\.tags', '\.vscode$', '\.idea$', '.root',
\      '^__pycache__$', '\.pyc$', '\.venv$', '\.wenv',
\      '\.aux$', '\.log$', '\.out$', '\.pdf$', '\.gz$',
\      '^node_modules$', '\.tern-project$','^package-lock.json$',
\      '\.ycm_extra_conf.py$',
\      '^\.undo$','^\.tmp$', '^\.netrwhist$', '^\.cache$',
\      '\.sass-cache$',
\      '.eslintrc.js', '.prettierrc.js', '.flake8', '.tern-project'
\ ]

"let NERDTreeShowLineNumbers=1
let g:NERDTreeWinPos=0

" For mouse click in NERDTree
let g:NERDTreeMouseMode=3

let g:NERDTreeIndicatorMapCustom = {
\     "Modified"  : "*",
\     "Staged"    : "^",
\     "Untracked" : "λ",
\     "Renamed"   : ">",
\     "Unmerged"  : "═",
\     "Deleted"   : "x",
\     "Dirty"     : "✗",
\     "Clean"     : "√",
\     'Ignored'   : '☒',
\     "Unknown"   : "?"
\ }
