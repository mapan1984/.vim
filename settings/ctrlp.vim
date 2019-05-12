let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore"
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" Ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0

let g:ctrlp_working_path_mode = 'ra'

" Because use `ctrlp_user_command`，ignore config are not used by CtrlP
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](node_modules|log|tmp)|(\.(git|svn|vscode))$',
  \ 'file': '\v\.(exe|so|dll|dat)$',
  \ }
set wildignore+=*/tmp/*,*\\tmp\\*,*.so,*.swp,*.zip,*.exe,*/.sass-cache/*,*/node_modules/*
