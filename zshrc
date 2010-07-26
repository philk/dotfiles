# Path to your oh-my-zsh configuration.
fpath=(/usr/local/share/zsh/functions)
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="gallifrey"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="false"

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# Pathing
PATH="/Users/phil/bin:${PATH}"
PATH="/Users/phil/Source/depot_tools:${PATH}"
PATH="/usr/local/bin:${PATH}"
PATH="/Users/phil/.cabal/bin:${PATH}"

export RUBYOPT="rubygems"
export RUBYLIB="/usr/local/lib:$RUBYLIB"

# export GEM_HOME="/opt/local/lib/ruby/gems/1.8"
# export RUBYLIB="/opt/local/lib/ruby"
# export TM_RUBY="/opt/local/bin/ruby"
# export RUBYPATH="/opt/local/bin/ruby"

export GOROOT=`brew --prefix`/Cellar/go/HEAD
export GOARCH=amd64
export GOOS=darwin

# ALIAS
alias vim="mvim"

# Program Setup
export GIT_EDITOR="vim"
export EDITOR="vim"
export PAGER=less

# rvm-install added line:
if [ -s ~/.rvm/scripts/rvm ] ; then source ~/.rvm/scripts/rvm ; fi
