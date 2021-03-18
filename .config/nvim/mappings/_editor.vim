nmap <S-y> y$
nmap cv "wyiw:%s/\<<C-r>w\>//g<left><left>

" Ctrl + y Copying whole file into clipboard
nnoremap <C-y> :%y+<CR>

" Ctrl + y  Copying lines selected in visual mode
vnoremap <C-y> "+y

" Ctrl + p Pasting texts from clipboard to vim
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP

nmap <Leader>f <Plug>(coc-format-selected)
nmap <Leader>h :nohls<CR>

" Map Ctrl + / to comment code
nmap <C-_> <Plug>CommentaryLine
vmap <C-_> <Plug>Commentary
