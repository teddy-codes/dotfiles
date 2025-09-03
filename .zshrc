# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:./node_modules/bin:$HOME/go/bin/:$PATH
export PATH="./node_modules/.bin:$HOME/bin:/usr/local/bin:./node_modules/.bin:$HOME/.local/bin:/usr/local/opt/python@3.9/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="custom"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Load nvm(node version manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias lg="lazygit"
alias v="nvim"
alias cat="bat"
alias cd="z"
alias l="ls -lah"
alias catp="bat --style plain"
alias rm="trash"
alias date="gdate"
alias gitg="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias f="fzf"
alias vf="nvim \$(fzf --preview 'bat --color=always --style=numbers --line-range :500 {}' --preview-window=up:30%:wrap)"
alias awswhoami="aws sts get-caller-identity"

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

eval "$(zoxide init zsh)"

function cleanDocker() {
  docker image prune -a -f
  docker container prune -f
  docker volume prune -f
  docker network prune -f
  docker system prune -a -f
}


export GPG_TTY=$(tty)
