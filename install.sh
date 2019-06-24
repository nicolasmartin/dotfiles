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
    title "Setting symbolic of $1 to $2"
    ln -s $1 $2
  fi
}

#################

title "Linking ~/.config folder"
lnif $dotfiles/.config $HOME/.config

echo "$dotfiles/.config $HOME/.config"


composer -v > /dev/null 2>&1
COMPOSER_IS_INSTALLED=$?
if [[ "$COMPOSER_IS_INSTALLED" -ne 0 ]]; then
    title "Installing Composer"
    sudo wget --quiet https://getcomposer.org/installer
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
lnif "$dotfiles/.git_bash" "$HOME/.git_bash"


title "Setting up shell config..."
lnif "$dotfiles/.zshrc" "$HOME/.zshrc"

if [ -e $HOME/.bashrc ]
then
        rm $HOME/.bashrc
fi
lnif $dotfiles/.bashrc $HOME/.bashrc


#tmux
lnif $dotfiles/.tmux.conf $HOME/.tmux.conf
lnif $dotfiles/tmux-themepack $HOME/.tmux-themepack


title "Installing NEOVIM"
sudo yum install install neovim

title "Installing silversearcher ag command"
sudo yum install the_silver_searcher
