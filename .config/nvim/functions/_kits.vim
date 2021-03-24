function! CompileScss()
  let current_file_name = expand('%:t:r')
  let current_file_path = expand('%:p:h')
  if current_file_name[0] == '_'
    return
  endif
  let current_file = current_file_path.'/'.current_file_name.'.scss'
  let css_file = current_file_path.'/'.current_file_name.'.css'
  let command_shell = 'npx node-sass '.current_file.' '.css_file
  let msg = jobstart(command_shell)
  echo msg
endfunction


function! g:Convert_Json()
  exec ":%s/'/\"/g"
  exec ":%s/None/\"None\"/g"
  exec ":%s/True/\"True\"/g"
  exec ":%s/False/\"False\"/g"
  exec ":%s/,*}/}/g"
  exec ":%!python -m json.tool"
endfunction

let g:ExecuteSupportedLang = {
      \'cpp': 's:CppExecutor',
      \'python': 's:PyExecutor',
      \'javascript': 's:NodeExecutor'
      \}

function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
