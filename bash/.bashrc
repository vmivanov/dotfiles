#
# Sanity checks
#
# Test for a non-interactive shell (e.g. scp) 
if [[ $- != *i* ]] ; then
	# Shell is non-interactive. Be done now!
	return
fi

#
# Apply the global bashrc first
#
if [ -f /etc/bash/bashrc ]; then
    source /etc/bash/bashrc
elif [ -f /etc/bash.bashrc ]; then
    source /etc/bash.bashrc
fi

#
# Prompt
#
if [ "color_prompt" ]; then
    PS1='[\[\033[01;32m\]\u@\h\[\033[0m\] \[\033[01;34m\]\W\[\033[0m\]]\$ '
else
    PS1='[\u@\h \W]\$ '
fi

#
# History
#
# Append to the history file instead of overwriting it
shopt -s histappend

# Ignore duplicate lines and lines starting with a space
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

#
# Aliases
#
alias ls='ls --color=auto -v -p --group-directories-first -N'
alias ll='ls -hl'
alias la='ls -lAh'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Git
alias g='git'
alias gco='git checkout'
alias gd='git diff'
alias gl='git pull'
alias grm='git rm'
alias gst='git status'

# Tmux
alias ta='tmux attach'
alias tad='tmux attach -d'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tksv='tmux kill-server'
alias tkss='tmux kill-session -t'

#
# Apply user and host specific bashrc
#
if [ -f ${HOME}/.bashrc.local ]; then
    source ${HOME}/.bashrc.local
fi

# vim: ft=sh ts=4 sts=4 sw=4 et
