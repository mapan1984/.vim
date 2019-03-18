"let g:ycm_key_invoke_completion = '<c-z>'
nnoremap <F12> :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nnoremap <S-F12> :YcmCompleter GoToReferences<CR>

" Python config
let g:ycm_python_binary_path = 'python3'
let g:ycm_global_ycm_extra_conf = g:home . '/.utils/config/.ycm_extra_conf.py'

" 屏蔽诊断信息
let g:ycm_show_diagnostics_ui = 0

" 不弹出函数原型的预览窗口
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0

" Close preview window when the offered completion is accepted
let g:ycm_autoclose_preview_window_after_completion=1

let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1

" 输入两个字符后即进行语义补全
let g:ycm_semantic_triggers =  {
       \ 'c,cpp,java,python,java,go,erlang,perl': ['re!\w{2}'],
       \ 'cs,lua,javascript,javascript.jsx,vim': ['re!\w{2}'],
       \ }

let g:ycm_filetype_whitelist = {
            \ 'c': 1,
            \ 'go': 1,
            \ 'sh': 1,
            \ 'cpp': 1,
            \ 'vim': 1,
            \ 'java': 1,
            \ 'python': 1,
            \ 'javascript': 1,
            \ 'javascript.jsx': 1,
            \ }

" gopath
if !empty($GOPATH) && len(split($GOPATH, ":")) > 1
   let g:ycm_gocode_binary_path = split($GOPATH, ":")[0] . "/bin/gocode"
   let g:ycm_godef_binary_path = split($GOPATH, ":")[0] . "/bin/godef"
elseif !empty($GOPATH) && len(split($GOPATH, ":")) == 1
   let g:ycm_gocode_binary_path = $GOPATH . "/bin/gocode"
   let g:ycm_godef_binary_path = $GOPATH . "/bin/godef"
endif
