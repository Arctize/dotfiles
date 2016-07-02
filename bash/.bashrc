#
# ~/.bashrc
#


[[ $- != *i* ]] && return

shopt -s autocd
set -o vi

PS1="\[\033[31m\]\u\033[0m\]@\033[32m\]\h \033[1;34m\]\w\[\033[0m \]$ "

export EDITOR=vim
export PATH=$PATH:~/bin/

alias ls='ls --color=auto'
alias la='ls -A'
alias ll='ls -Alh'
alias l='ls'
alias grep='grep --color=auto'
alias peerflix='peerflix --mpv'

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
	    . /usr/share/bash-completion/bash_completion
