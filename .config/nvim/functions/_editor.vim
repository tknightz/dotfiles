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
