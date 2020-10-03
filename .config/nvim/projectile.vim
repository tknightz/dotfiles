function! Change_Dir(...)
  let paths = split(a:1)
  echo paths
  :exec "cd " . paths[4]
  if exists("g:NERDTree")
    :silent exec ":NERDTreeCWD"
  endif
endfunction

" \'sink': 'ChangeDir ',
function! g:List_Projects(...)
  if !filereadable($HOME . '/.config/nvim/.projects')
    :call writefile([], $HOME . '/.config/nvim/.projects', '')
  endif
  let projects = readfile($HOME . '/.config/nvim/.projects')
  :call map(projects, {k,v -> k . '   ' . split(v)[0] . '  ' . split(v)[1]})
  return fzf#run(fzf#wrap({ 
        \'source': extend(['Project   >>    Path'], projects), 
        \'sink': function('Change_Dir'),
        \'options': '+m --ansi --tiebreak=begin --header-lines=1'}))
endfunction

function! g:Add_New_Project()
    call inputsave()
    let project_name = substitute(input(" Project's name: "), " ", "", "g")
    if strlen(trim(project_name)) < 2
      :redraw
      :echo "Wrong name!"
      return 
    endif
    call inputrestore()
    
    call inputsave()
    :set wildignorecase
    let project_path = input(" " . project_name . "'s Path : ", $HOME . '/', 'dir')
    call inputrestore()

    let project_git_root = system('git -C ' . project_path . ' rev-parse --show-toplevel 2> /dev/null')[:-2]
    if strlen(project_git_root) > 2
      :call writefile([project_name . "\t\t" . project_git_root], $HOME . '/.config/nvim/.projects', 'a')
    else
      :call writefile([project_name . "\t\t" . project_path], $HOME . '/.config/nvim/.projects', 'a')
    endif
    :redraw
    echo "Created project ".project_name
endfunction

function! Git_Checkout_Branch()
    call inputsave()
    let branch_name = fzf#run(fzf#wrap({'source': 'git branch -a --format "%(refname:short)" | sed -e "s/\w*\///g" | sort -u',  'sink': 'silent Git checkout ','options': '+m --ansi --tiebreak=begin --header-lines=1 --prompt="  Branch >> "'}))
        
    if strlen(branch_name) < 2
      echo 'Cancelled!'
      return
    endif
    :silent exec ":Git checkout ".branch_name
    :redraw
    echo "You're in ".branch_name
    call inputrestore()
endfunction


function! Git_New_Branch()
    call inputsave()
    let branch_name = input(" Branch's name: ")
    :silent exec ":Git branch ".branch_name
    :redraw
    call inputrestore()
    :silent exec ":Git checkout ".branch_name
    echo "Created branch. Switch to ".branch_name
endfunction

function! CopyPath()
  let @+ = expand('%')
  echo "Copied file path."
endfunction


function! Current_File_Proj()
  let s:current_file_path = expand('%:p:h')
  if strlen(s:current_file_path) > 2
    :exec ":Files " . system('git -C '. s:current_file_path . ' rev-parse --show-toplevel')[:-2]
  else
    :exec ":Files ."
  endif
endfunction

function! Delete_Project(...)
  if !filereadable($HOME . '/.config/nvim/.projects')
    :call writefile([], $HOME . '/.config/nvim/.projects', '')
  endif
  let projects = readfile($HOME . '/.config/nvim/.projects')
  let line = split(a:1)
  let path = str2nr(line[0]) 

  echo "Are you sure want to delete " . split(projects[path])[0] . "? (Y)es/(n)o?"
  let choice = nr2char(getchar())
  if choice == 'y'
    :redraw
    :echo "Removed " . split(projects[path])[0]
    :call remove(projects, path, path)
    :call writefile(projects, $HOME . '/.config/nvim/.projects')
  else
    :redraw 
    :echo "Cancelled!"
    return
  endif
  echo "Cancelled!"
endfunction


function! g:Remove_Project()
  if !filereadable($HOME . '/.config/nvim/.projects')
    :call writefile([], $HOME . '/.config/nvim/.projects', '')
  endif
  let projects = readfile($HOME . '/.config/nvim/.projects')
  :call map(projects, {k,v -> k . '   ' . split(v)[0] . '  ' . split(v)[1]})
  return fzf#run(fzf#wrap({ 
        \'source': projects, 
        \'sink': function('Delete_Project'),
        \'options': '+m --prompt="Remove Project >> "'}))
endfunction

