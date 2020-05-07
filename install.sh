TEST=`cat /etc/os-release | grep arch`

# Check if arch or debian

if [ $TEST ]
then 
	sudo pacman -S git vim vifm neovim tmux zsh ibus xclip bat ripgrep -y
else
	sudo apt install git vim vifm neovim tmux zsh ibus xclip bat ripgrep -y
fi

# Install Vim-plug
# For Nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# For Vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir ~/.fonts

cp ./Fonts/*.ttf ~/.fonts
fc-cache -f -v
cp -r ./.config/* ~/.config
cp .vimrc ~

sudo echo options iwlwifi bt_coex_active=0 swcrypto=1 11n_disable=8 >> /etc/modprobe.d/iwlwifi.conf 

gsettings set org.freedesktop.ibus.panel xkb-icon-rgba '#FFFFFF'


# Install and config oh-my-zsh
chmod +x install_omz.sh
sh ./install_omz.sh

