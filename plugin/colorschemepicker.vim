command! CSLove :call colorschemepicker#LoveCS()
command! CSHate :call colorschemepicker#HateCS()
command! CSshow :call colorschemepicker#ShowCS()
command! CSBack :call colorschemepicker#BackCS()
command! CSnext :call colorschemepicker#RandomPick()

nnoremap <leader>yi :call colorschemepicker#SynStack()<CR>
