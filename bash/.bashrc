#
# ~/.bashrc
#


[[ $- != *i* ]] && return

shopt -s autocd
export EDITOR=vim
export PATH=$PATH:~/bin/

#PS1='[\u@\h \W]\$ '
PS1="\[\033[31m\]\u\033[0m\]@\033[32m\]\h \033[1;34m\]\w\[\033[0m \]$ "

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
	    . /usr/share/bash-completion/bash_completion
