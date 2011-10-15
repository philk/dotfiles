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

# z
if (( $+commands[brew] )) ; then
  . `brew --prefix`/etc/profile.d/z.sh
  function precmd () {
    z --add "$(pwd -P)";
    title $ZSH_THEME_TERM_TAB_TITLE_IDLE $ZSH_THEME_TERM_TITLE_IDLE;
  }
fi

