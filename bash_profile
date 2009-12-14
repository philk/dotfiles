if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

# PATH Setup
# PATH="/opt/local/bin:/opt/local/sbin:/usr/local/bin:${PATH}"
# PATH="/opt/local/Library/Frameworks/Python.framework/Versions/Current/bin:${PATH}"
PATH="/Users/phil/bin:${PATH}"
PATH="/Users/phil/Source/depot_tools:${PATH}"
PATH="/usr/local/bin:${PATH}"

MANPATH="/opt/local/share/man:${MANPATH}"
export MANPATH

# Ruby Setup
# export RUBYOPT="rubygems"
# export GEM_HOME="/opt/local/lib/ruby/gems/1.8"
# export RUBYLIB="/opt/local/lib/ruby"
# export TM_RUBY="/opt/local/bin/ruby"
# export RUBYPATH="/opt/local/bin/ruby"

alias vim="mvim"
alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs"


# rvm-install added line:
if [[ -s /Users/phil/.rvm/scripts/rvm ]] && [[ $rvm_loaded_flag != 1 ]] ; then source /Users/phil/.rvm/scripts/rvm ; fi

