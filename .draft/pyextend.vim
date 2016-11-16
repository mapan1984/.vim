function! GetHtml()
python<<EOF
import vim, urllib
print "%s" % vim.current.line
handle = urllib.request.urlopen(vim.current.line)
vimcurrentbuffer[:] = handle.read().split('\n')
EOF
endfunction

map <leader>gh :call GetHtml()<CR>
