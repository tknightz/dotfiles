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


" Ctrl + y Copying whole file into clipboard
nnoremap <C-y> :%y+<CR>
" Ctrl + y  Copying lines selected in visual mode
vnoremap <C-y> "+y
" Ctrl + p Pasting texts from clipboard to vim
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP

function! g:Convert_Json()
  exec ":%s/'/\"/g"
  exec ":%s/None/\"None\"/g"
  exec ":%s/True/\"True\"/g"
  exec ":%s/False/\"False\"/g"
  exec ":%s/,*}/}/g"
  exec ":%!python -m json.tool"
endfunction

nnoremap <silent> <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


nmap <Leader>f <Plug>(coc-format-selected)

nmap <Leader>h :nohls<CR>

" Mapping for window spliting
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

" Map Ctrl + / to comment code
nmap <C-_> <Plug>CommentaryLine
vmap <C-_> <Plug>Commentary

" Map Y to yank until end of line
nmap <S-y> y$
nmap cv "wyiw:%s/\<<C-r>w\>//g<left><left>
nmap <expr> cl &ft!='python' ? '"wyiwgd[{V%:s/\<<C-r>w\>//g<left><left>' : '"wyiw?def<cr>jVNk:s/\<<C-r>w\>//g<left><left>'
