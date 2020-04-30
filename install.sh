TEST=`cat /etc/os-release | grep arch`

# Check if arch or debian

if [ $TEST ]
then 
	sudo pacman -S git vim vifm neovim tmux zsh ibus -y
else
	sudo apt install git vim vifm neovim tmux zsh ibus -y
fi


# Install zsh syntax highlight)
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install zsh autosuggestion)
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install Vim-plug
# For Nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# For Vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir ~/.config
mkdir ~/.config/nvim
mkdir ~/.config/vifm
mkdir ~/.config/alacritty
mkdir ~/.fonts

cp ./Fonts/*.tff ~/.fonts
fc-cache -f -v
cp -r ./.config/ ~/.config
cp .zshrc .vimrc ~

echo options iwlwifi bt_coex_active=0 swcrypto=1 11n_disable=8 >> /etc/modprobe.d/iwlwifi.conf 

gsettings set org.freedesktop.ibus.panel xkb-icon-rgba '#FFFFFF'


# Install zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install powerlevel9k
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k


