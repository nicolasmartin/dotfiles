#!/usr/bin/env sh

dotfiles="$HOME/dotfiles"

echo "Setting up submodules..."
cd $dotfiles
git submodule init
git submodule update


lnif() {
  if [ ! -e $2 ] ; then
    ln -s $1 $2
  fi
}

echo "Setting up vim..."
lnif $dotfiles/.vim $HOME/.vim
lnif $dotfiles/.vimrc $HOME/.vimrc


echo "Setting up gitconfig..."
lnif $dotfiles/.gitconfig $HOME/.gitconfig


echo "Setting up zsh..."
lnif $dotfiles/.zshrc $HOME/.zshrc

echo "Setting up phpactor via composer..."
cd $dotfiles/.vim/bundle/phpactor
composer install


zsh
