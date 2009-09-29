# PATH Setup
PATH="/opt/local/bin:/opt/local/sbin:/usr/local/bin:${PATH}"
PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:${PATH}"
PATH="/Users/phil/bin:${PATH}"
PATH="/Users/phil/Source/depot_tools:${PATH}"

MANPATH="/opt/local/share/man:${MANPATH}"
export MANPATH

# Ruby Setup
export RUBYOPT="rubygems"
export GEM_HOME="/opt/local/lib/ruby/gems/1.8"
export RUBYLIB="/opt/local/lib/ruby"
export TM_RUBY="/opt/local/bin/ruby"
export RUBYPATH="/opt/local/bin/ruby"

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

# History
export HISTCONTROL=ignoredups
export HISTFILESIZE=3000
export HISTIGNORE="ls:cd:[bf]g:exit:..:...:ll:lla"
alias h=history
hf(){
		grep "$@" ~/.bash_history
}

# Colors
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1

# Misc
shopt -s checkwinsize
bind "set completion-ignore-case on"
bind "set bell-style none"
bind "set show-all-if-ambiguous on"

# Completion
if [ -f /opt/local/etc/bash_completion ]; then
		. /opt/local/etc/bash_completion
fi
source ~/bin/git-completion.bash

# Alias
alias ..='cd ..'
alias ...='cd .. ; cd ..'
alias ducks='du -cksh * | sort -rn|head -11'
alias untar="tar zxvf"
alias vim="~/bin/mvim"

# Program Setup
export GIT_EDITOR="mate -w"
export EDITOR="mate -w"
export PAGER=less

export PS1='\h:\w $(parse_git_branch)$ '