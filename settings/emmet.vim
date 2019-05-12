" Enable just for html/css/jsx
let g:user_emmet_install_global = 0
autocmd FileType html,htmljinja,css,javascript EmmetInstall

"autocmd FileType html,htmljinja,css,javascript imap <buffer> <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Note that the trailing , still needs to be entered, so the new keymap would be <C-e>,.
let g:user_emmet_leader_key='<c-e>'

let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}
