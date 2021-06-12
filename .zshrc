autoload -U colors && colors

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored 
zstyle ':completion:*' format '%d'
zstyle ':completion:*' group-name ''
zstyle :compinstall filename '/home/rouven/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install

export GPG_TTY=$(tty)
PROMPT='%B%~%b $ '
