export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

export EDITOR=vim
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
bakgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset
 
export PATH="$(brew --prefix php@7.1)/bin:$PATH"

alias ll='ls -lash'

#git completion
source ~/git-completion.sh

#kube-ps1
source /usr/local/opt/kube-ps1/share/kube-ps1.sh

__parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

function tailf {
  if [ ! -z $1 ]; then
    sudo tail -f $1
  else
    echo "Usage: tailf [path to log]"
  fi
}

function watchf {
  watch -n 1 'free -m && echo ''  && df -h | grep "$1"'
}

PS1="\n$txtcyn\u@\h$txtrst:\w$txtylw \n\$(kube_ps1)$txtgrn git:$txtred\$(__parse_git_branch)$txtrst\n> "

# For Gitlab
export GITLAB_CI_TOKEN="CB9sqasyvpixtAu4Zywi"
export SCMP_CI_TOKEN=$GITLAB_CI_TOKEN
export API_DOMAIN=scmpdevuat.scmp.com
export SCMP_URL_BASE=scmpdevuat.scmp.com
export API_PORT=81
export API_PROTOCOL=http
export API_TOKEN="tyH4YutRToPFg23vW6R4kBQ4LKvZBt38bnNdYZNUK20"

# Login registry if in interactive shell.
if [ -z "$PS1" ]; then
  if [ -x "$(which docker)" ]; then
    if ! grep -q "registry.scmp.tech" ~/.docker/config.json ; then
      echo -n "Logging into registry.scmp.tech ... "
      docker login -u "gitlab-ci-token" -p "$SCMP_CI_TOKEN" "registry.scmp.tech"
    fi
  fi
fi

# for bash_complettion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
source <(stern --completion=bash)

# For GO
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# For fasd
eval "$(fasd --init auto)"
