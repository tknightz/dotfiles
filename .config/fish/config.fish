set -U fish_greeting

# ╭──────────────────────────────────────────────────────────╮
# │                        Variables                         │
# ╰──────────────────────────────────────────────────────────╯
set -gx FZF_DEFAULT_COMMAND "rg --files --hidden -g '!{.git/*,node_modules/*}'"
set -gx XDG_CURRENT_DESKTOP "KDE"
set -gx BAT_THEME "base16"
set -gx BROWSER brave
set -gx EDITOR nvim
set -Ux PYENV_ROOT $HOME/.pyenv
set -gx RIPGREP_CONFIG_PATH $HOME/.config/ripgrep

set -gx LESS ""
set -gx DELTA_PAGER 'less -R'
set -gx LS_COLORS (vivid generate snazzy)
set -gx LIBVA_DRIVER_NAME 'iHD'


# set -gx PATH $PATH:$HOME/.config/vifm/scripts/:$HOME/.gem/ruby/2.7.0/bin/:$HOME/go/bin
fish_add_path -g $HOME/go/bin $HOME/.gem/ruby/2.7.0/bin $HOME/.config/vifm/scripts $HOME/.local/bin $PYENV_ROOT/bin $HOME/.cargo/bin
# fish_add_path $HOME/.local/share/bob/nvim-bin



# ╭──────────────────────────────────────────────────────────╮
# │                         mappings                         │
# ╰──────────────────────────────────────────────────────────╯
bind \co edit_command_buffer
bind \ck forward-char
bind \ck accept-autosuggestion
bind \ch backward-word
bind \cu kill-whole-line
# bind \cl forward-word



# ╭──────────────────────────────────────────────────────────╮
# │                           pnpm                           │
# ╰──────────────────────────────────────────────────────────╯
set -gx PNPM_HOME "/home/tknightz/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end


# ╭──────────────────────────────────────────────────────────╮
# │                           bun                            │
# ╰──────────────────────────────────────────────────────────╯
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH


pyenv init - | source
starship init fish | source
