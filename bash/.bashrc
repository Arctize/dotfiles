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

# enable vi mode
set -o vi
bind -m vi-insert "\c-l":clear-screen
bind 'set show-mode-in-prompt on'

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

# Colored prompt
#PS1="\[\033[31m\]\u\033[0m\]@\033[32m\]\h \033[1;34m\]\w\[\033[0m \]$ "
function exitstatus {

	EXITSTATUS="$?"
	BOLD="\[\033[1m\]"
	RED="\[\033[1;31m\]"
	GREEN="\[\e[32;1m\]"
	BLUE="\[\e[34;1m\]"
	OFF="\[\033[m\]"

	if [ "${EXITSTATUS}" -eq 0 ]
	then
		status="${BOLD}${GREEN}:)${OFF}"
	else
		status="${BOLD}${RED}:(${OFF}"
	fi

	PS1="\u@\h ${BLUE}\W${OFF} ${status} "

	PS2="${BOLD}>${OFF} "
}

PROMPT_COMMAND=exitstatus

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
