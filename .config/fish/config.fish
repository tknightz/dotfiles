set -U fish_greeting

# set -gx TERM "screen-256color"
set -gx GOPATH $HOME/go
fish_add_path $HOME/.config/vifm/scripts
fish_add_path /usr/local/go/bin
fish_add_path $HOME/go/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.cargo/bin

set -gx FZF_DEFAULT_COMMAND "rg --files --hidden -g '!{.git/*,node_modules/*}'"
set -gx DELTA_PAGER "less -R"
set -gx LESS ""
set -gx BAT_THEME "base16"
set -U BROWSER brave
set -Ux EDITOR nvim
set -Ux PROXY_DOCKER "http://172.17.0.1:3128"


# set -gx HOST_IP (host (hostname) | grep -oP '(\s)\d+(\.\d+){3}' | tail -1 | awk '{ print $NF }' | tr -d '\r')
set -Ux HOST_IP 10.116.224.53
set -Ux DISPLAY $HOST_IP:0.0
set -Ux PULSE_SERVER "tcp:$HOST_IP"
set -U LD_LIBRARY_PATH "$LD_LIBRARY_PATH:/usr/local/lib"
set -gx NO_AT_BRIDGE 1
set -gx LIBGL_ALWAYS_INDIRECT 1
set -gx CHOKIDAR_USEPOLLING 1
set -g LS_COLORS (vivid generate snazzy)

# set -gx NVM_DIR "$HOME/.nvm"

# keybindings
bind \co edit_command_buffer
bind \ck forward-char
bind \ch backward-word
bind \cl forward-word
bind \cu kill-whole-line

# starship init fish | source
