function! s:ReadRange(...)
  let arg1 = str2nr(a:1)
  let arg2 = str2nr(a:2)
  if type(arg1) == type(0) && type(arg2) == type(0)
    if arg1 == 0 || arg2 ==0
      :echo "Wrong argument format!"
    elseif arg1 > arg2
      :echo "Make sure end-line > begin-line"
    elseif filereadable(a:3)
      :execute "r! sed -n " . a:1 . "," . a:2 ."p " . a:3
    else
      :echo "Error! Make sure input file exist!"
    endif
  else
    :echo "Wrong argument format!"
  endif
endfunction

command! -nargs=* -complete=file ReadRange call s:ReadRange(<f-args>)
:cnoreabbrev rr ReadRange

function! Expander()
  let line   = getline(".")
  let col    = col(".")
  let first  = line[col-2]
  let second = line[col-1]
  let third  = line[col]

  if first == ">"
    if second == "<" && third == "/"
      return "\<CR>\<C-o>==\<C-o>O"
      " return "\<CR>\<ESC>O"
    else
      return "\<CR>"
    endif
  else
    return "\<CR>"
  endif
endfunction

:imap <expr> <CR> Expander()

" Tab to complete in cocnvim
function! TabCompletation()
    if(&ft=='html' || &ft=='css')
        return 1
    else
        return 0
    endif
endfunction

" imap <expr> <Tab> TabCompletation() ? emmet#expandAbbrIntelligent("\<tab>") : pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<Tab>" : coc#refresh()
imap <expr> <Tab> TabCompletation() ? emmet#expandAbbrIntelligent("\<tab>") : pumvisible() ? "\<C-n>" : "\<Tab>"


" Tab to toggle fold
function! ToggleFold()
    try
        :norm zA 
    catch
        echo 'Cannot toggle fold!'
    endtry
endfunction

" nmap <Tab> :call ToggleFold()<CR>
nmap <silent> <Tab> :call ToggleFold()<CR>
