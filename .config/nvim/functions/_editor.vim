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

function! Git_Get_Hunks()

  let symbols = ['+', '-', '~']
  let [added, modified, removed] = GitGutterGetHunkSummary()
  let stats = [added, removed, modified]  " reorder
  let hunkline = ''

  let s:is_git_folder = FugitiveHead()
  if !empty(s:is_git_folder)
    for i in range(3)
      let hunkline .= printf('%s%s ', symbols[i], stats[i])
    endfor
  endif

  if !empty(hunkline)
    let hunkline = printf('%s', hunkline[:-2])
  endif

  return hunkline
endfunction

function! g:QuitVim()
  let bufnr = bufnr()
  if exists("g:executor_bufnr") && bufnr == g:executor_bufnr
    exec ':bd!'
  else
    exec ':q'
  endif
endfunction

command! QuitVim call g:QuitVim()

function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))
