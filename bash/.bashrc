#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it
shopt -s histappend

# For setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=-1
export HISTFILESIZE=-1
# http://superuser.com/questions/20900/bash-history-loss
export HISTFILE=~/.bash_eternal_history

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Automatically change directory
shopt -s autocd

# Don't show ctrl char spam
bind 'set echo-control-characters off'

# Enable vi mode
#set -o vi
#bind -m vi-insert "\c-l":clear-screen
#bind 'set show-mode-in-prompt on'

# Change the terminal cursor to a pipe in vi-mode and to a box in cmd mode.
#bind 'set vi-cmd-mode-string "\1\x1b[\x30 q\e[31;1m\2>\1\033[m\2"'
#bind 'set vi-ins-mode-string "\1\x1b[\x35 q\e[32;1m\2▸\1\033[m\2"'

# Make life more colorful
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	alias dir='dir --color=auto'
	alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'

	alias ip='ip --color=auto'
fi

# Colors used in the prompt
bold="\[\033[1m\]"
red="\[\033[1;31m\]"
green="\[\e[32;1m\]"
blue="\[\e[34;1m\]"
purple="\[\e[35;1m\]"
grey="\[\e[37;1m\]"
off="\[\033[m\]"

# Source the git prompt in a trillion different ways because why on earth would
# distros ever have it packaged similarly
git_prompt_paths=(
	"/usr/share/git/git-prompt.sh"                         # Arch
	"/usr/share/git-core/contrib/completion/git-prompt.sh" # Fedora
	"/usr/lib/git-core/git-sh-prompt"                      # Ubuntu/Debian
)
for f in "${git_prompt_paths[@]}"; do
	# shellcheck source=/dev/null
	[ -f "$f" ] && source "$f" && break
done

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto"

function setprompt() {

	# Check exit status of last command and change the color accordingly
	if [ $? -eq 0 ]; then
		local status="${green}\$"
	else
		local status="${red}\$"
	fi

	local session_type=
	local host="\h"

	# Add indicator icon for container and SSH sessions
	if [[ -f /run/.containerenv ]]; then
		session_type="🐳"
		if [[ -f /run/.toolboxenv ]]; then
			session_type="${red}🛠 ${off}"
			host=$(grep "^name=" /run/.containerenv | cut -d'=' -f2 | tr -d '"')
		fi
	elif [[ -n "$SSH_CLIENT" ]] || [[ -n "$SSH_TTY" ]]; then
		session_type="${purple}🖧 ${off}"
	fi

	title_prompt="\u@${host} \w"
	title="\[\e]0;${title_prompt}\a\]"

	shell_prompt="${session_type}${bold}${host} ${blue}\w${off}$(__git_ps1) ${status} ${off}"

	PS1="${title}${shell_prompt}"
	PS2="${bold}>${off} "

	# Cursor blink
	echo -en '\e[5 q'
}

PROMPT_DIRTRIM=3
PROMPT_COMMAND=setprompt

# Colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Set EDITOR variable
if hash nvim 2>/dev/null; then
	export EDITOR=nvim
elif hash vim 2>/dev/null; then
	export EDITOR=vim
else
	export EDITOR=vi
fi

# Alias definitions.
alias r='ranger'
alias v='$EDITOR'
alias o='rifle $(fzf)'
alias ll='ls -lh'
alias la='ls -A'
alias l='ls -CF'
alias gipfl='git push --force-with-lease' # 🥐

# Enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

# Arch and Debian/Ubuntu package /usr/share/bash-completion/completions/kubectl
# Fedora does not, in that case source it manually
hash kubectl 2>/dev/null &&
	[ ! -e /usr/share/bash-completion/completions/kubectl ] &&
	source <(kubectl completion bash)

# Similar story for helm
hash helm 2>/dev/null &&
	[ ! -e /usr/share/bash-completion/completions/helm ] &&
	source <(helm completion bash)

# Either load wal theme or enable scripts for base16 color schemes when running st
if [ "$TERM" == "st-256color" ] || [ "$TERM" == "alacritty" ]; then
	if [ -e ~/.cache/wal/sequences ]; then
		(cat ~/.cache/wal/sequences &)
	else
		# Base16 Shell
		BASE16_SHELL="$HOME/.config/base16-shell/"
		[ -n "$PS1" ] &&
			[ -s "$BASE16_SHELL/profile_helper.sh" ] &&
			eval "$("$BASE16_SHELL/profile_helper.sh")"
	fi
fi

# Move prompt to bottom resp. top of the terminal
down() {
	for i in $(seq $(tput lines)); do echo; done
	bind -x '"\C-l": clear; down'
}

up() {
	bind -x '"\C-l": clear'
	clear
}
