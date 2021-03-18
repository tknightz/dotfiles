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


function! Get_Branch_Name(...)
  let branch_name = a:1
  silent exec ":Git checkout ".branch_name
  let current_branch = system('git branch --show-current')
  if current_branch != branch_name
    echohl ErrorMsg 
    echo "Please commit your changes or stash them before you switch branches."  
    echohl None
  else
    echo "You're in ".branch_name
  endif
endfunction

function! Git_Checkout_Branch()
    let s:current_file_path = expand('%:p:h')
    let s:current_project = system('git -C '. s:current_file_path . ' rev-parse --show-toplevel 2> /dev/null')[:-2]
    if exists('s:current_project')
      call fzf#run(fzf#wrap({
      \'source': 'git -C ' . s:current_file_path .  ' branch -a --format "%(refname:short)" | sed -e "s/\w*\///g" | sort -u',  
      \'sink': function('Get_Branch_Name'),
      \'options': '--ansi --tiebreak=begin --prompt="  Branch >> "'}))
    else
      echohl WarningMsg
      echo "You're not in git project!"
      echohl None
    endif
endfunction

function! Git_New_Branch()
    call inputsave()
    let branch_name = input(" Branch's name: ")
    let standard_branch_name = substitute(branch_name, " ", "-", "g")
    silent exec ":Git branch ".standard_branch_name
    call inputrestore()
    silent exec ":Git checkout ".standard_branch_name
    redraw!
    echo "Created branch. Switch to ".standard_branch_name
endfunction
