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

augroup terminal_settings
  if has('nvim')
    autocmd!
    " autocmd BufWinEnter,WinEnter term://* startinsert
    autocmd BufLeave term://* stopinsert
    autocmd TermOpen * setlocal nonumber norelativenumber signcolumn=no
    autocmd TermOpen * startinsert
    autocmd TermClose term://*
        \ if exists('g:compile_mode') && (g:compile_mode == 1) |
        \   let g:compile_mode = 0 |
        \ elseif (expand('<afile>') !~ "fzf") && (expand('<afile>') !~ "ranger") && (expand('<afile>') !~ "coc") |
        \   call nvim_input('<CR>')  |
        \ endif
  endif
augroup END
