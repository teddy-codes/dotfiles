# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export HOME="/home/$(whoami)"
export ZSH="$HOME/.oh-my-zsh"
export PATH="./node_modules/.bin:$PATH"
export PATH="../node_modules/bin:$PATH"
export GOPATH="$HOME/go"
export GOROOT="/usr/local/go"
export PATH="$GOPATH/bin:$GOROOT/bin:$HOME/.local:$PATH"
export TERM=xterm-256color
export DEFAULT_USER=robert
export EDITOR="vim"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="blinks"

# custom script files
alias zshconfig="vim ~/.zshrc"
alias zshrc="source ~/.zshrc"
alias vimconfig="vim ~/.vimrc"
alias sshconfig="vim ~/.ssh/config"
alias gitg="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
# this is literally to fix the crap syntax highlighting of vim after a certain character count due to the line above. aaaaaaaaaaa
alias projects="~/Documents/projects"
alias mongo:up="docker start mongo"
alias mongo:down="docker kill mongo"
alias v:up="amixer -D pulse sset Master 5%+"
alias v:down="amixer -D pulse sset Master 5%-"
alias v:off="amixer -D pulse sset Master 0%"
# so you can set percentage directly as a CLI arg like v: 40%
alias v:="amixer -D pulse sset Master" 
alias gs="git status"
alias su="scanunlimited"
alias cat="batcat"
alias vim="nvim"

plugins=(
    git
)

function kt-go() {
  export PROJECT_DIRECTORY=$1
  kitty --session ~/.config/kitty/go.conf
}

source $ZSH/oh-my-zsh.sh

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Added by serverless binary installer
export PATH="$HOME/.serverless/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
