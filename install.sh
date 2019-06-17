#!/usr/bin/env sh

BASEDIR=$(dirname "$0")
cd $BASEDIR

dotfiles="$HOME/dotfiles"

title() {
echo ""
   echo -e "$(tput bold)\033[38;5;20m\033[48;5;15m>>> $1$(tput sgr0)"
}

lnif() {
  if [ ! -e $2 ] ; then
    ln -s $1 $2
  fi
}

#################

title "Linking ~/.config folder"
ln -s "$dotfiles/.config" "$HOME/.config"

composer -v > /dev/null 2>&1
COMPOSER_IS_INSTALLED=$?
if [[ "$COMPOSER_IS_INSTALLED" -ne 0 ]]; then
    title "Installing Composer"
    udo wget --quiet https://getcomposer.org/installer
    hhvm -v ResourceLimit.SocketDefaultTimeout=30 -v Http.SlowQueryThreshold=30000 installer
    sudo mv composer.phar /usr/local/bin/composer
    sudo rm installer
fi


title "Setting up submodules..."
cd "$dotfiles"
git submodule init
git submodule update


title "Setting up vim..."
lnif "$dotfiles/.vim" "$HOME/.vim"
if [ -e $HOME/.vimrc ]
then
	rm $HOME/.vimrc
fi
lnif $dotfiles/.vimrc $HOME/.vimrc


title "Setting up gitconfig..."
lnif "$dotfiles/.gitconfig" "$HOME/.gitconfig"
ln -s "$dotfiles/.git_bash" "$HOME/.git_bash"


title "Setting up shell config..."
lnif "$dotfiles/.zshrc" "$HOME/.zshrc"

if [ -e $HOME/.bashrc ]
then
        rm $HOME/.bashrc
fi
ln -s "$dotfiles/.bashrc" "$HOME/.bashrc"


#tmux
ln -s "$dotfiles/.tmux.conf" "$HOME/.tmux.conf"
ln -s "$dotfiles/tmux-themepack" "$HOME/.tmux-themepack"


title "Installing NEOVIM with all Python stuff"
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
sudo apt-get install python-dev python-pip python3-dev python3-pip
pip3 install neovim --user

title "Installing silversearcher ag command"
sudo apt-get install silversearcher-ag
