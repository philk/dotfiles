# Path to your oh-my-zsh configuration.
fpath=(/usr/local/share/zsh/functions)
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="gallifrey"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="false"
plugins=(git ruby gem brew)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# Pathing
PATH="/usr/local/share/python:${PATH}"
PATH="${HOME}/bin:${PATH}"
PATH="${HOME}/Source/depot_tools:${PATH}"
PATH="${HOME}/.cabal/bin:${PATH}"
PATH="/usr/local/share/npm/bin:${PATH}"
PATH="/usr/local/bin:/usr/local/sbin:${PATH}"

export GNUPGHOME="${HOME}/.gnupg"

# Go
export GOROOT=`brew --prefix`/Cellar/go/HEAD
export GOARCH=amd64
export GOOS=darwin

# Python
export ARCHFLAGS="-arch i386 -arch x86_64"
export PIP_USE_MIRRORS=true
export WORKON_HOME=${HOME}/.venvs
export PIP_VIRTUALENV_BASE=${WORKON_HOME}
export PIP_RESPECT_VIRTUALENV=true
if [ -f /usr/local/share/python/virtualenvwrapper.sh ]; then
  source /usr/local/share/python/virtualenvwrapper.sh
else
  source /usr/local/bin/virtualenvwrapper.sh
fi

# Node
export NODE_PATH="/usr/local/lib/node"

# ALIAS
alias vim="mvim"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
alias flush="dscacheutil -flushcache" # Flush DNS cache
alias ql="qlmanage -p 2>/dev/null" # preview a file using QuickLook
getip() {
  dig +short $1 | pbcopy
}
alias filesum="ls -lh $@; ls -l $@ | awk '{ SUM += \$5} END { print SUM/1024/1024/1024 }'"

# Chef Aliases
alias kcu="knife cookbook upload $1"
alias kcc="knife cookbook create $1"

# Corrections fixes
alias knife="nocorrect knife"

# Program Setup
export GIT_EDITOR="mvim -f"
export EDITOR="mvim -f"
export PAGER=less

# rvm-install added line:
if [ -s ~/.rvm/scripts/rvm ] ; then
  source ~/.rvm/scripts/rvm
  RPS1="$RPS1 \$(rvm-prompt)"
fi

function jc {
  jmx_host=$1
  jmx_port=${2:-8080}
  proxy_host=${3:-$jmx_host}
  proxy_port=${4:-8123}

  echo "connecting jconsole to $jmx_host:$jmx_port via SOCKS proxy $proxy_host using local port $proxy_port"
  ssh -f -ND $proxy_port $proxy_host
  jconsole -J-DsocksProxyHost=localhost -J-DsocksProxyPort=${proxy_port} service:jmx:rmi:///jndi/rmi://${jmx_host}:${jmx_port}/jmxrmi
  kill $(ps ax | grep "[s]sh -f -ND $proxy_port" | awk '{print $1}')
}

# Idiot-proof git aliases
# http://notes.envato.com/developers/rebasing-merge-commits-in-git/
# https://gist.github.com/590895
function git_current_branch() {
  git symbolic-ref HEAD 2> /dev/null | sed -e 's/refs\/heads\///'
}

alias gpthis='git push origin HEAD:$(git_current_branch)'
alias grb='git rebase -p'
alias gup='git fetch origin && grb origin/$(git_current_branch)'
alias gm='git merge --no-ff'
