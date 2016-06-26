[[ $- != *i* ]] && return

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

autoload -U colors && colors
autoload -Uz compinit
compinit

setopt autocd extendedglob nomatch notify nocorrectall

PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[green]%}%m %{$fg_bold[blue]%}%~ %{$reset_color%}%# "
export EDITOR=vim

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias peerflix='peerflix --mpv'

bindkey -M viins '^r' history-incremental-search-backward

zstyle ':completion:*:(ssh|scp|sftp):*' hosts $(awk '{print $1}' ~/.ssh/known_hosts 2>/dev/null)

