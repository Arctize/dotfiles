#
# ~/.bashrc
#


[[ $- != *i* ]] && return

shopt -s autocd
export EDITOR=vim

#PS1='[\u@\h \W]\$ '
PS1="\[\033[31m\]\u\033[0m\]@\033[32m\]\h \033[1;34m\]\w\[\033[0m \]$ "

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias y='yaourt'
alias s='systemctl'

export PATH=$PATH:~/bin/

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
	./etc/bash_completion
fi
