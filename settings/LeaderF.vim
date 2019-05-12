let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<m-b>'
noremap <m-m> :LeaderfMru<cr>
noremap <m-f> :LeaderfFunction<cr>
noremap <m-b> :LeaderfBuffer<cr>
noremap <m-t> :LeaderfTag<cr>

let g:Lf_StlColorscheme = 'powerline'
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_RootMarkers = g:project_root_markers
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_PreviewResult = {'Function': 0, 'Colorscheme':1}

let g:Lf_NormalMap = {
   \ 'File':           [['<ESC>', ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
   \ 'Buffer':         [['<ESC>', ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
   \ 'Mru':            [['<ESC>', ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
   \ 'Tag':            [['<ESC>', ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
   \ 'Function':       [['<ESC>', ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
   \ 'Colorscheme':    [['<ESC>', ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
   \ }

let s:vim_cache_lf = expand('~/.vim/.cache')
let g:Lf_CacheDirectory = s:vim_cache_lf
if !isdirectory(s:vim_cache_lf)
   silent! call mkdir(s:vim_cache_lf, 'p')
endif

" 禁用 Gtags 自动生成
let g:Lf_GtagsAutoGenerate = 0
