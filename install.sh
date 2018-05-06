#!/usr/bin/env sh

dotfiles="$HOME/dotfiles"

echo "Setting up vim..."

lnif() {
  if [ ! -e $2 ] ; then
    ln -s $1 $2
  fi
}

lnif $dotfiles/.vim $HOME/.vim
lnif $dotfiles/.vimrc $HOME/.vimrc
lnif $dotfiles/.zshrc $HOME/.zshrc



