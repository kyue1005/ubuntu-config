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

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


# setup
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"
eval "$(mise activate bash)"
eval "$(oh-my-posh init bash --config $HOME/.mytheme.omp.json)"

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

# User custom configuration (loaded before plugins so it can configure plugins, toggles, and env)
[ -f ~/.bash_custom ] && . ~/.bash_custom

# ------------------------------------------------------------------------------
# Oh-My-Zsh Style Plugins
# ------------------------------------------------------------------------------
# Define which plugins to load (defaults to all available plugins if not overridden in ~/.bash_custom):
if [ -z "${plugins+x}" ]; then
  plugins=(
    aws
    git
    kubectl
    pulumi
    terraform
  )
fi

# Feature toggles (set to false to disable category globally)
ENABLE_PLUGIN_ALIASES="${ENABLE_PLUGIN_ALIASES:-true}"
ENABLE_PLUGIN_FUNCS="${ENABLE_PLUGIN_FUNCS:-true}"
ENABLE_PLUGIN_AUTOCOMPLETE="${ENABLE_PLUGIN_AUTOCOMPLETE:-true}"

# Per-plugin overrides can also be set in ~/.bash_custom, e.g.:
# DISABLE_KUBECTL_ALIAS=true
# DISABLE_AWS_FUNC=true

BASH_CONFIG_DIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd)"
if [ -f "$BASH_CONFIG_DIR/lib/plugin-loader.bash" ]; then
  . "$BASH_CONFIG_DIR/lib/plugin-loader.bash"
  load_plugins "$BASH_CONFIG_DIR/plugins"
fi

# User custom overrides (unversioned / local, runs after plugins to allow overriding plugin aliases/funcs)
[ -f ~/.bash_aliases ] && . ~/.bash_aliases
[ -f ~/.bash_func ] && . ~/.bash_func
[ -f ~/.bash_autocomplete ] && . ~/.bash_autocomplete

# for Cloudflare warp
export NODE_EXTRA_CA_CERTS=/usr/local/share/ca-certificates/cloudflare-root.crt
export REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
export CURL_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt

# Go configuration
export GOPROXY=https://proxy.golang.org,direct
export PATH="$HOME/go/bin:$PATH"

# add krew to the PATH
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
