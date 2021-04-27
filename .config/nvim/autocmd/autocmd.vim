"     .___________. __  ___
"     |           ||  |/  /
"     `---|  |----`|  '  /
"         |  |     |    <
"         |  |     |  .  \
"         |__|     |__|\__\
"       ______   ______   .__   __.  _______  __    _______
"      /      | /  __  \  |  \ |  | |   ____||  |  /  _____|
"     |  ,----'|  |  |  | |   \|  | |  |__   |  | |  |  __
"     |  |     |  |  |  | |  . `  | |   __|  |  | |  | |_ |
"     |  `----.|  `--'  | |  |\   | |  |     |  | |  |__| |
"      \______| \______/  |__| \__| |__|     |__|  \______|
"
"
"     This is my personal configurations for vim, nvim.
"     You can customize it to solve your problems.


" Scss auto compile
command CompileScss call CompileScss()
au BufWritePost *.scss call CompileScss()

" nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

augroup docker_stuff
  autocmd! BufWritePre Dockerfile exe "%s/^\\(\\w*\\)/\\U\\1"
augroup END

function! Find_Previous_Word()
  let col_num = col('.')
  let row_num = line('.')
  let keyword = ''
  if col_num == 1
    let row_num = row_num - 1
    let col_num = col('$') - 1
  endif

  let idx_col = col_num
  while getline(row_num)[idx_col] != ' ' && idx_col >= 0
    let keyword = getline(row_num)[idx_col].keyword
    let idx_col = idx_col - 1
  endwhile
  " let keyword = toupper(keyword)
  return toupper(keyword)
endfunction

augroup sql_stuff
augroup END


" Don't jump cursor when saving file
" function! <SID>StripTrailingWhitespaces()
"     let l = line(".")
"     let c = col(".")
"     %s/\s\+$//e
"     call cursor(l, c)
" endfun

augroup terminal_settings
  if has('nvim')
    autocmd!
    " autocmd BufWinEnter,WinEnter term://* startinsert
    autocmd BufLeave term://* stopinsert
    autocmd TermOpen * setlocal nonumber norelativenumber signcolumn=no
    autocmd TermOpen * startinsert
    " autocmd TermClose term://*
    "     \ if exists('g:compile_mode') && (g:compile_mode == 1) |
    "     \   let g:compile_mode = 0 |
    "     \ elseif (expand('<afile>') !~ "fzf") && (expand('<afile>') !~ "ranger") && (expand('<afile>') !~ "coc") |
    "     \   call nvim_input('<CR>')  |
    "     \ endif

    " autocmd TermLeave term://*
    "     \ if (expand('<afile>') !~ "fzf") && (expand('<afile>') !~ "ranger") && (expand('<afile>') !~ "coc") |
    "     \   call nvim_input('<CR>')  |
    "     \ endif
  endif
augroup END

