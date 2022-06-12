set -U fish_greeting

set -gx FZF_DEFAULT_COMMAND "rg --files --hidden -g '!{.git/*,node_modules/*}'"
# alias rg "rg --hidden -g '!{.git/*,node_modules/*}'"
set -gx BAT_THEME "base16"
set -gx BROWSER brave
set -gx EDITOR nvim


# set -gx PATH $PATH:$HOME/.config/vifm/scripts/:$HOME/.gem/ruby/2.7.0/bin/:$HOME/go/bin
fish_add_path -g $HOME/go/bin $HOME/.gem/ruby/2.7.0/bin $HOME/.config/vifm/scripts $HOME/.local/bin


set -gx FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS'
--color=dark
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
'
set -gx LESS ""
set -gx DELTA_PAGER 'less -R'
# set -gx LS_COLORS (vivid generate snazzy)

set -gx GLFW_IM_MODULE ibus
set -gx GTK_IM_MODULE ibus
set -gx QT_IM_MODULE ibus
set -gx XMODIFIERS @im=ibus


function __fish_default_command_not_found_handler --on-event fish_command_not_found
  functions --erase __fish_command_not_found_setup
  echo "'$argv' not found"
end


starship init fish | source
