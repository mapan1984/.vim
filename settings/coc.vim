" if hidden is not set, TextEdit might fail.
set hidden

" don't give |ins-completion-menu| messages.
set shortmess+=c

" :CocInstall coc-snippets
" Use <C-l> to trigger snippet expand.
" imap <localleader>l <Plug>(coc-snippets-expand)
" Use <C-j> to select text for visual text of snippet.
" vmap <localleader>j <Plug>(coc-snippets-select)
" Use <C-j> to jump to forward placeholder, which is default
let g:coc_snippet_next = '<c-j>'
" Use <C-k> to jump to backward placeholder, which is default
let g:coc_snippet_prev = '<c-k>'


" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use <tab> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <tab> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <cr> "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> <leader>td <Plug>(coc-definition)
nmap <silent> <leader>ty <Plug>(coc-type-definition)
nmap <silent> <leader>ti <Plug>(coc-implementation)
nmap <silent> <leader>tr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
