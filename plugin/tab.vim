" tab explore
nnoremap <tab>x :Texplore<cr>
" open file in new tab
" noremap <c-o> :tabedit <c-r>=expand("%:p:h")<cr>/
" create new file in new tab
nnoremap <c-n> :tabnew <c-r>=expand("%:p:h")<cr>/

" 关闭当前标签页
nnoremap <tab>c :tabclose<cr>
" 关闭所有其它的标签页
nnoremap <tab>o :tabonly<cr>
" 当前标签页成为最后一个
nnoremap <tab>m :tabmove<cr>

" ===== tab切换 =====
nnoremap <tab>f :tabfirst<cr>
nnoremap <tab>l :tablast<cr>
nnoremap <tab>n :tabnext<cr>
nnoremap <tab>p :tabprev<cr>
nnoremap <tab>1 :tabn 1<cr>
nnoremap <tab>2 :tabn 2<cr>
nnoremap <tab>3 :tabn 3<cr>
nnoremap <tab>4 :tabn 4<cr>
nnoremap <tab>5 :tabn 5<cr>

""" make tabline in terminal mode
""function! Vim_NeatTabLine()
""    let s = ''
""    for i in range(tabpagenr('$'))
""        " select the highlighting
""        if i + 1 == tabpagenr()
""            let s .= '%#TabLineSel#'
""        else
""            let s .= '%#TabLine#'
""        endif
""        " set the tab page number (for mouse clicks)
""        let s .= '%' . (i + 1) . 'T'
""        " the label is made by MyTabLabel()
""        let s .= ' %{Vim_NeatTabLabel(' . (i + 1) . ')} '
""    endfor
""    " after the last tab fill with TabLineFill and reset tab page nr
""    let s .= '%#TabLineFill#%T'
""    " right-align the label to close the current tab page
""    if tabpagenr('$') > 1
""        let s .= '%=%#TabLine#%999XX'
""    endif
""    return s
""endfunc
""
""" get a single tab name
""function! Vim_NeatBuffer(bufnr, fullname)
""    let l:name = bufname(a:bufnr)
""    if getbufvar(a:bufnr, '&modifiable')
""        if l:name == ''
""            return '[No Name]'
""        else
""            if a:fullname
""                return fnamemodify(l:name, ':p')
""            else
""                return fnamemodify(l:name, ':t')
""            endif
""        endif
""    else
""        let l:buftype = getbufvar(a:bufnr, '&buftype')
""        if l:buftype == 'quickfix'
""            return '[Quickfix]'
""        elseif l:name != ''
""            if a:fullname
""                return '-'.fnamemodify(l:name, ':p')
""            else
""                return '-'.fnamemodify(l:name, ':t')
""            endif
""        else
""        endif
""        return '[No Name]'
""    endif
""endfunc
""
""" get a single tab label
""function! Vim_NeatTabLabel(n)
""    let l:buflist = tabpagebuflist(a:n)
""    let l:winnr = tabpagewinnr(a:n)
""    let l:bufnr = l:buflist[l:winnr - 1]
""    return Vim_NeatBuffer(l:bufnr, 0)
""endfunc
""
""" get a single tab label in gui
""function! Vim_NeatGuiTabLabel()
""    let l:num = v:lnum
""    let l:buflist = tabpagebuflist(l:num)
""    let l:winnr = tabpagewinnr(l:num)
""    let l:bufnr = l:buflist[l:winnr - 1]
""    return Vim_NeatBuffer(l:bufnr, 0)
""endfunc
""
""" setup new tabline, just like %M%t in macvim
""set tabline=%!Vim_NeatTabLine()
""set guitablabel=%{Vim_NeatGuiTabLabel()}

" 左移 tab
""function! Tab_MoveLeft()
""    let l:tabnr = tabpagenr() - 2
""    if l:tabnr >= 0
""        exec 'tabmove '.l:tabnr
""    endif
""endfunc
""
""" 右移 tab
""function! Tab_MoveRight()
""    let l:tabnr = tabpagenr() + 1
""    if l:tabnr <= tabpagenr('$')
""        exec 'tabmove '.l:tabnr
""    endif
""endfunc
""
""noremap <silent><leader>tl :call Tab_MoveLeft()<cr>
""noremap <silent><leader>tr :call Tab_MoveRight()<cr>
""noremap <silent><m-left> :call Tab_MoveLeft()<cr>
""noremap <silent><m-right> :call Tab_MoveRight()<cr>

