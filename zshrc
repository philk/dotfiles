# Path to your oh-my-zsh configuration.
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

PATH="/Users/phil/bin:${PATH}"
PATH="/Users/phil/Source/depot_tools:${PATH}"
PATH="/usr/local/bin:${PATH}"

export RUBYOPT="rubygems"
# export GEM_HOME="/opt/local/lib/ruby/gems/1.8"
# export RUBYLIB="/opt/local/lib/ruby"
# export TM_RUBY="/opt/local/bin/ruby"
# export RUBYPATH="/opt/local/bin/ruby"

# ALIAS
alias vim="mvim"

# Program Setup
export GIT_EDITOR="vim"
export EDITOR="vim"
export PAGER=less

# rvm-install added line:
if [[ -s /Users/phil/.rvm/scripts/rvm ]] && [[ $rvm_loaded_flag != 1 ]] ; then source /Users/phil/.rvm/scripts/rvm ; fi

