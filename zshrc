# Path to your oh-my-zsh configuration.
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
plugins=(git github node ruby gem brew osx knife)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
setopt extendedglob            # awesome pattern matching (ala Dir.glob() in Ruby)
setopt autocd                  # change to dirs without cd
setopt promptcr                # ensure a new line before prompt is drawn
setopt listpacked              # compact completion lists
setopt notify                  # notify of BG job completion immediately

export PATH="${HOME}/bin:${HOME}/local/bin:${PATH}"
export GNUPGHOME="${HOME}/.gnupg"

# ALIAS
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
alias filesum="ls -lh $@; ls -l $@ | awk '{ SUM += \$5} END { print SUM/1024/1024/1024 }'"

# Chef Aliases
alias kcu="knife cookbook upload $1"
alias kcc="knife cookbook create $1"

# Corrections fixes
alias knife="nocorrect knife"

# rbenv setup
if [ -s ~/.rbenv/bin/rbenv ] ; then
  export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
  eval "$(rbenv init - zsh)"
  export RPS1="$RPS1 \$(rbenv version-name)"
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

function git_current_origin() {
  git config --get remote.origin.url | sed -e 's/^.*\://' | sed -e 's/\.git.*//'
}

alias gpr='open "https://github.com/$(git_current_origin)/pull/new/$(git_current_branch)"'
alias gpthis='git push origin HEAD:$(git_current_branch)'
alias grb='git rebase -p'
alias gup='git fetch origin && grb origin/$(git_current_branch)'
alias gm='git merge --no-ff'
alias gs='git status -sb'

# Stolen from https://github.com/gf3/dotfiles/blob/master/.functions
# Copy w/ progress
cp_p () {
  rsync -WavP --human-readable --progress $1 $2
}
# All the dig info, 'cause I can never remember it
digga () {
  dig +nocmd $1 any +multiline +noall +answer
}

if [[ $(uname) == 'Darwin' ]]; then
  . ~/.zshrc-osx
elif [[ $(uname) == 'Linux' ]]; then
  . ~/.zshrc-linux
fi
