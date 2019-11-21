if executable('pyls')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'pyls',
    \ 'cmd': {server_info->['pyls']},
    \ 'whitelist': ['python'],
    \ })
else
  echohl ErrorMsg
  echom 'Sorry, `pyls` is not installed. See :h vim-lsp-python for more details on setup.'
  echohl NONE
endif
