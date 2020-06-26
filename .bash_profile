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
 
alias ll='ls -lash'
alias kctx='kubectx'
alias kns='kubens'

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
export GITLAB_USERNAME="kelvin.yue"
export GITLAB_CI_TOKEN="CB9sqasyvpixtAu4Zywi"
export SCMP_CI_TOKEN=$GITLAB_CI_TOKEN

#scmp-d8
export API_DOMAIN=scmpdevuat.scmp.com
export SCMP_URL_BASE=scmpdevuat.scmp.com
export API_PORT=81
export API_PROTOCOL=http
export API_TOKEN="tyH4YutRToPFg23vW6R4kBQ4LKvZBt38bnNdYZNUK20"

# scmp-pwa
export API_D8_HOST="staging-scmp-d8.product-web.dev-2.scmp.tech"
export SENTRY_DSN="https://50226ce1e592446895d91490ab8e7590@sentry.io/251860"
export GTM_ACCOUNT_ID="GTM-N3FDTB9"
export GRAPHQL_D8_PROTOCOL="https"
export GRAPHQL_D8_HOST="staging-apigw.product-web.dev-2.scmp.tech/d8/v1"
export GRAPHQL_D8_APIKEY="1DHVoK6d09e9Usm4Cvujj1vParXGv3Lt"
export GRAPHQL_CONTENTSERVICE_PROTOCOL="https"
export GRAPHQL_CONTENTSERVICE_HOST="staging-apigw.product-web.dev-2.scmp.tech/content-delivery/v1"
export GRAPHQL_CONTENTSERVICE_APIKEY="1DHVoK6d09e9Usm4Cvujj1vParXGv3Lt"
export GPT_AD_SITE_NAME="scmptestsite.com/stagweb"
export LIFTIGNITER_JS_KEY="fcblcfnivfc20f2l"
export WITH_ANALYZER="true"
export USER_COOKIE_DOMAIN=".scmp.tech"

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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kelvin.yue/google-cloud-sdk/path.bash.inc' ]; then . '/Users/kelvin.yue/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kelvin.yue/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/kelvin.yue/google-cloud-sdk/completion.bash.inc'; fi

# Use proxy registry
export NPM_CONFIG_REGISTRY=http://172.17.30.3:4873
export NPM_CI_USERNAME=kelvin.yue
export NPM_CI_TOKEN=CB9sqasyvpixtAu4Zywi
export NPM_CI_EMAIL=kelvin.yue@scmp.com
export NPM_PROXY_REGISTRY_AUTH=//172.17.30.3:4873/:_authToken="FYSsCw9CG52MWmPjHOMckD5vJVcpStBl9UDoj0UNmUY="

# Vault
export PATH=$PATH:$HOME/vault
export VAULT_ADDR="https://vault.dev-2.scmp.tech"
complete -C /Users/kelvin.yue/vault/vault vault

# Krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
