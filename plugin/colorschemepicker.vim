command! CSLove :call colorschemepicker#LoveCS()
command! CSHate :call colorschemepicker#HateCS()
command! CSShow :call colorschemepicker#ShowCS()
command! CSBack :call colorschemepicker#BackCS()
command! CSNext :call colorschemepicker#RandomPick()

nnoremap <leader>yi :call colorschemepicker#SynStack()<CR>
