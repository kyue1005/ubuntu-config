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
	if [ ! -z $1 ]; then
		tail -f $1
	else
		echo "Usage: tailf [path to log]"
	fi
}

function watchf
{
	watch -n 1 'free -m && df -h | grep "$1"'
}
