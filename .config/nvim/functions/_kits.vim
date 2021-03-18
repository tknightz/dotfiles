function! CompileScss()
  let current_file = expand('%')
  let css_file = substitute(current_file, 'scss', 'css', 'g')
  " exe '!npx node-sass '.current_file.' '.css_file.' -q'
  let command_shell = 'npx node-sass '.current_file.' '.css_file.' -q' 
  :call jobstart(command_shell)
endfunction


function! g:Convert_Json()
  exec ":%s/'/\"/g"
  exec ":%s/None/\"None\"/g"
  exec ":%s/True/\"True\"/g"
  exec ":%s/False/\"False\"/g"
  exec ":%s/,*}/}/g"
  exec ":%!python -m json.tool"
endfunction
