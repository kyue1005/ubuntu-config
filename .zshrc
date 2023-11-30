# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/kelvinyue/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias kns="kubectl ns"
alias kctx="kubectl ctx"
alias k="kubectl"
alias kdp='kubectl describe pod'
alias kdn='kubectl describe node'
alias kgp='kubectl get po'
alias kgpa='kubectl get po --all-namespaces'
alias kgpe='kubectl get po --all-namespaces | egrep -v "Running|Completed"'
alias kgn='kubectl get node'
alias kl='kubectl logs -f'
alias ktp='kubectl top pod'
alias ktn='kubectl top node'
alias ksql='kubectl delete po mysql-cli; kubectl run mysql-cli --image=mysql:5.7 -it --rm --restart=Never -- /bin/bash;'
alias kmongo='kubectl delete po mongo; kubectl run mongo --image=mongo:5.0 -it --rm --restart=Never -- /bin/bash;'
alias kpsql='kubectl delete po postgres; kubectl run postgres --image=postgres:13 -it --rm --restart=Never -- /bin/bash;'
alias kcurl='kubectl delete po curl; kubectl run curl --image=alpine/curl -it --rm --restart=Never -- /bin/sh;'
alias kawscli='kubectl delete po aws-cli; kubectl run aws-cli --image=amazon/aws-cli -it --rm --restart=Never --command -- /bin/bash;'
alias t="terraform"
alias gcp="gcloud"
alias gtidy="sh ~/git-tidy.sh"
alias tiv="terraform init && terraform validate"
alias tivp="terraform init && terraform validate && terraform plan -out tfplan"

ap() { export AWS_PROFILE="$1"; }
gswitch() { git co "$1" && git pull }
ksocat() { kubectl delete po socat-$1; kubectl run socat-$1 --image=alpine/socat -- "TCP-LISTEN:$4,fork" "TCP:$2:$3" && kubectl wait --for=condition=Ready pod/socat-$1 && kubectl port-forward socat-$1 $4; }

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source <(kubectl completion zsh)

echo "source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme"

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:/Applications/Wireshark.app/Contents/MacOS/

autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

export HOMEBREW_NO_AUTO_UPDATE=1

export GITLAB_TOKEN=BzB2DM5E3R1yMjb5khTA

export MONGODB_ATLAS_ENABLE_BETA=true

export CLOUDSDK_PYTHON="python3"

# Sonarcloud provider
export SONARCLOUD_ORGANIZATION=apoidea
export SONARCLOUD_TOKEN=204849f97b787d0fbbc4f813976d742486531176

# Atlas provider
# Superacc
export MONGODB_ATLAS_PRIVATE_KEY=af447fd2-2ebc-48ec-889a-5815f0f1b419; export MONGODB_ATLAS_PUBLIC_KEY=gifzprqq

# Superacc SCB
# export MONGODB_ATLAS_PRIVATE_KEY=c8b75287-3d3e-4b8a-8274-a77195eef125; export MONGODB_ATLAS_PUBLIC_KEY=legjcrfz

# EJ
# export MONGODB_ATLAS_PRIVATE_KEY=2ea212e1-bb86-45a9-997d-7f85f9cdb10b; export MONGODB_ATLAS_PUBLIC_KEY=vfpmfsls

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kelvinyue/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kelvinyue/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kelvinyue/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kelvinyue/google-cloud-sdk/completion.zsh.inc'; fi
alias tivp="terraform init && terraform validate && terraform plan -out tfplan"

eval "$(logcli --completion-script-zsh)"

