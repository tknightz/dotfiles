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

let $CONFiG_DIR = expand('$HOME/.config/nvim')

source $CONFiG_DIR/plugins/plugins.vim
source $CONFiG_DIR/variables/variables.vim
source $CONFiG_DIR/functions/functions.vim
source $CONFiG_DIR/autocmd/autocmd.vim
source $CONFiG_DIR/mappings/mappings.vim
source $CONFiG_DIR/others/others.vim
