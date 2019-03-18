set statusline=
set statusline+=%{lessmess#statusline()}

set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline

function! Lessmess()
    if exists('*lessmess#statusline')
        return lessmess#statusline()
    endif
    return ''
endfunction

let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \    'left': [
    \        [ 'mode', 'paste' ],
    \        [ 'gitbranch', 'readonly', 'filename', 'modified' ],
    \    ],
    \    'right': [
    \        [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
    \        [ 'lessmess' ],
    \        [ 'cocstatus' ],
    \        [ 'lineinfo', 'percent' ],
    \        [ 'tagbar', 'fileformat', 'fileencoding', 'filetype' ],
    \    ]
    \ },
    \ 'component': {
    \     'lineinfo': '∬ %3l:%-2v',
    \     'readonly': '%{&readonly?"":""}',
    \     'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}'
    \ },
    \ 'component_function': {
    \     'gitbranch': 'fugitive#head',
    \     'lessmess': 'Lessmess',
    \     'mode': 'LightlineMode',
    \     'cocstatus': 'coc#status'
    \ }
\ }

let g:lightline.component_expand = {
    \ 'linter_checking': 'lightline#ale#checking',
    \ 'linter_warnings': 'lightline#ale#warnings',
    \ 'linter_errors': 'lightline#ale#errors',
    \ 'linter_ok': 'lightline#ale#ok',
\ }

let g:lightline.component_type = {
    \ 'linter_checking': 'left',
    \ 'linter_warnings': 'warning',
    \ 'linter_errors': 'error',
    \ 'linter_ok': 'left',
\ }

let g:lightline.separator = {
    \ 'left': '', 'right': ''
\ }

let g:lightline.subseparator = {
    \ 'left': '', 'right': ''
\}

let g:lightline.tabline = {
    \ 'left': [ ['tabs'] ],
    \ 'right': [ ['close'] ]
\ }


function! LightlineMode()
  let fname = expand('%:t')
  return fname ==# '__Tagbar__' ? 'Tagbar' :
        \ fname ==# 'ControlP' ? 'CtrlP' :
        \ fname ==# '__Gundo__' ? 'Gundo' :
        \ fname ==# '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ?  'NERDTree':
        \ &ft ==# 'unite' ? 'Unite' :
        \ &ft ==# 'vimfiler' ? 'VimFiler' :
        \ &ft ==# 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

