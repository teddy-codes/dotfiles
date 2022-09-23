export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git macos)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/opt/homebrew/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin/:$PATH

# -------------------------------------------------------------------
# some alias settings, just for fun
# -------------------------------------------------------------------
alias 'dus=du -sckx * | sort -nr'
alias 'bk=cd $OLDPWD'
alias lh='ls -a | egrep "^\."'

# -------------------------------------------------------------------
# make some commands (potentially) less destructive
# -------------------------------------------------------------------
alias 'rm=trash'

# -------------------------------------------------------------------
# Git
# -------------------------------------------------------------------
alias ga='git add'
alias gp='git push'
alias gc='git commit'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gco='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'
alias gta='git tag -a -m'
alias gf='git reflog'


# sort files in current directory by the number of words they contain
alias 'wordy=wc -w * | sort | tail -n10'
alias 'filecount=ls -aRF | wc -l'

# -------------------------------------------------------------------
# Functions ported directly from .bashrc
# -------------------------------------------------------------------
# turn hidden files on/off in Finder
# be mindful that this takes many attempts sometimes.
function hiddenOn() {
  defaults write com.apple.Finder AppleShowAllFiles YES;
  killall Finder;
}
function hiddenOff() {
  defaults write com.apple.Finder AppleShowAllFiles NO;
  killall Finder;
}

# myIP address
function myip() {
  ifconfig lo0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "lo0       : " $2}'
  ifconfig en0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en0 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
  ifconfig en0 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en0 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
  ifconfig en1 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en1 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
  ifconfig en1 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en1 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
}

#
## save a specific file path for use later
#
s() { pwd > ~/.save_dir ; }
i() { cd "$(cat ~/.save_dir)" ; }

eval "$(zoxide init zsh)"