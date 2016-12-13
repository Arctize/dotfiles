[[ $- != *i* ]] && return

HISTFILE=~/.bash_history
HISTSIZE=5000
SAVEHIST=1000

autoload -U colors && colors
autoload -Uz compinit
compinit

setopt autocd extendedglob nomatch notify nocorrectall

PS1="%{$fg[green]%}%m %{$fg_bold[blue]%}%~ %{$reset_color%}%# "

export EDITOR=vim
export PATH=$PATH:~/bin
export WALLPAPER="$HOME/.wallpaper"

alias ls='ls --color=auto'
alias la='ls -A'
alias ll='ls -Alh'
alias l='ls'
alias grep='grep --color=auto'
alias peerflix='peerflix --mpv'

bindkey -M viins '^r' history-incremental-search-backward

zstyle ':completion:*:(ssh|scp|sftp):*' hosts $(awk '{print $1}' ~/.ssh/known_hosts 2>/dev/null)
