PATH=$PATH:~/.fzf/bin

alias vi=nvim
export TERM=xterm-256color


#
#
# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

source $HOME/dotfiles/antigen.zsh

antigen use oh-my-zsh
antigen bundle git
antigen bundle composer
antigen bundle jerguslejko/zsh-symfony-completion
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

#antigen theme eendroroy/alien
#antigen theme https://github.com/denysdovhan/spaceship-prompt spaceship
antigen bundle voronkovich/symfony.plugin.zsh
#antigen theme candy
antigen bundle changyuheng/zsh-interactive-cd  # permet d'utiliser fzf pour la commande cd
antigen apply


black=$(tput -Txterm setaf 0)
red=$(tput -Txterm setaf 1)
green=$(tput -Txterm setaf 2)
yellow=$(tput -Txterm setaf 3)
dk_blue=$(tput -Txterm setaf 4)
pink=$(tput -Txterm setaf 5)
lt_blue=$(tput -Txterm setaf 6)

bold=$(tput -Txterm bold)
reset=$(tput -Txterm sgr0)

# Nicely formatted terminal prompt
PS1="\n\[$bold\]\[$black\][\[$dk_blue\]\@\[$black\]]-[\[$green\]\u\[$yellow\]@\[$green\]\h\[$black\]]-[\[$pink\]\w\[$black\]]\[\033[0;33m\]\[\033[00m\]\[$reset\]\n\[$reset\]\$ "
