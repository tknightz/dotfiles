setup_color() {
	# Only use colors if connected to a terminal
	if [ -t 1 ]; then
		RED=$(printf '\033[31m')
		GREEN=$(printf '\033[32m')
		YELLOW=$(printf '\033[33m')
		BLUE=$(printf '\033[34m')
		BOLD=$(printf '\033[1m')
		RESET=$(printf '\033[m')
	else
		RED=""
		GREEN=""
		YELLOW=""
		BLUE=""
		BOLD=""
		RESET=""
	fi
}

setup_color

TEST=`cat /etc/os-release | grep arch`

# Check if arch or debian

if [ $TEST ]
then 
    echo "${BLUE} Detected OS :${RESET} ${GREEN}Arch${RESET}."
	sudo pacman -S git vim vifm neovim tmux zsh ibus xclip bat ripgrep -y
else
    echo "${BLUE} Detected OS :${RESET} ${GREEN}Ubuntu${RESET}."
	sudo apt install git vim vifm neovim tmux zsh ibus xclip -y
  curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
  sudo apt install nodejs
fi

# Install Vim-plug
# For Nvim
echo "${BLUE}Installing Nvim...${RESET}"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# For Vim
echo "${BLUE}Installing Vim...${RESET}"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "${BLUE}Configuring...${RESET}"
cp -r ./.config/* ~/.config
cp .vimrc ~
vim -c 'PlugInstall' \
    -c 'qa'
nvim -c 'PlugInstall' \
    -c 'qa'

echo "${BLUE}Installing Fonts...${RESET}"
mkdir -p ~/.fonts
cp ./Fonts/*.ttf ~/.fonts
cp ./Fonts/*.otf ~/.fonts
fc-cache -f -v


# sudo echo options iwlwifi bt_coex_active=0 swcrypto=1 11n_disable=8 >> /etc/modprobe.d/iwlwifi.conf 

gsettings set org.freedesktop.ibus.panel xkb-icon-rgba '#FFFFFF'


# Install and config oh-my-zsh
chmod +x install_omz.sh
sh ./install_omz.sh

