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

echo "Pathing"
# Pathing
PATH="/Users/phil/bin:${PATH}"
PATH="/Users/phil/Source/depot_tools:${PATH}"
PATH="/usr/local/bin:/usr/local/sbin:${PATH}"
PATH="/Users/phil/.cabal/bin:${PATH}"
PATH="/usr/local/share/npm/bin:${PATH}"
# PATH="/usr/local/Cellar/python/2.7.1/bin:${PATH}"

# export RUBYOPT="rubygems"
# export RUBYLIB="/usr/local/lib:$RUBYLIB"

# export GEM_HOME="/opt/local/lib/ruby/gems/1.8"
# export RUBYLIB="/opt/local/lib/ruby"
# export TM_RUBY="/opt/local/bin/ruby"
# export RUBYPATH="/opt/local/bin/ruby"

export GOROOT=`brew --prefix`/Cellar/go/HEAD
export GOARCH=amd64
export GOOS=darwin

# Node
export NODE_PATH="/usr/local/lib/node"

# EC2
export EC2_CERT=${HOME}/.ec2/cert-leapfile.pem
export EC2_PRIVATE_KEY=${HOME}/.ec2/pk-leapfile.pem
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home
export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.3-62308/jars"
export AWS_RDS_HOME="/usr/local/Cellar/rds-command-line-tools/1.3.003/jars"
export AWS_CLOUDWATCH_HOME="/usr/local/Cellar/cloud-watch/1.0.9.3/jars"
export SERVICE_HOME="$AWS_CLOUDWATCH_HOME"
export AWS_ELB_HOME="/usr/local/Cellar/elb-tools/1.0.11.0/jars"

# ALIAS
alias vim="mvim"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
alias flush="dscacheutil -flushcache" # Flush DNS cache
alias ql="qlmanage -p 2>/dev/null" # preview a file using QuickLook

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
if [ -s ~/.rvm/scripts/rvm ] ; then source ~/.rvm/scripts/rvm ; fi
