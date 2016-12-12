# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# automatically change directory
shopt -s autocd

bind 'set echo-control-characters off'

# enable vi mode
#set -o vi
#bind -m vi-insert "\c-l":clear-screen
#bind 'set show-mode-in-prompt on'

# Change cursor depending on mode
#bind 'set vi-cmd-mode-string "\[\x1b[\x30 q\]"'
#bind 'set vi-ins-mode-string "\[\x1b[\x35 q\]"'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Color prompt
bold="\[\033[1m\]"
red="\[\033[1;31m\]"
green="\[\e[32;1m\]"
blue="\[\e[34;1m\]"
grey="\[\e[37;1m\]"
off="\[\033[m\]"

function setprompt {

 	gitbranch=$(git branch 2>/dev/null | grep ^*)
	
 	if [ "$gitbranch" ]; then
		gitstatus=" $grey($gitbranch)"
 	else
 		gitstatus=""
 	fi

	if [ $? -eq 0 ];then
		statuscolor="$green"
	else
		statuscolor="$red"
	fi

	PS1="$bold\h $blue\W$gitstatus $statuscolor\$ $off"
	PS2="$bold>$off "
}

PROMPT_COMMAND=setprompt

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# set EDITOR variable
if hash vim 2>/dev/null; then
	export EDITOR=vim
else
	export EDITOR=vi
fi

# Alias definitions.
alias ll='ls -lh'
alias la='ls -A'
alias l='ls -CF'
alias peerflix='peerflix --mpv'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

# Enable scripts for base16 color schemes
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Move prompt to bottom resp. top of the terminal
down () {
	for i in $(seq $(tput lines)); do echo; done
	bind -x '"\C-l": clear; down'
}

up () {
	bind -x '"\C-l": clear'
	clear
}

# Add fuck alias
alias fuck='TF_CMD=$(TF_ALIAS=fuck PYTHONIOENCODING=utf-8 TF_SHELL_ALIASES=$(alias) thefuck $(fc -ln -1)) && eval $TF_CMD && history -s $TF_CMD'
