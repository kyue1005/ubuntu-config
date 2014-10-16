export CLICOLOR=1

export LSCOLORS=ExFxCxDxBxegedabagacad

export EDITOR=vim
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

source ~/git-completion.sh

alias ll='ls -lash'

function tailf
{
	tail -f $1
}

function watchf
{
	watch -n 1 'free -m && df -h | grep "$1"'
}
