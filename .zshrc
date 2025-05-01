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
  export EDITOR='mvim'
fi

# Load nvm(node version manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias git="hub"
alias lg="lazygit"
alias gclean="git branch | grep -v "master" | xargs git branch -D"
alias v="nvim"

alias cat="bat"
alias cd="z"
alias l="ls -lah"
alias catp="bat --style plain"
alias rm="trash"
alias date="gdate"
alias gitg="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias f="fzf"

alias awswhoami="aws sts get-caller-identity"

alias te-dev="doppler-te-terminal dev"
alias te-prod="doppler-te-terminal prod"
alias te-legacy="doppler-te-terminal legacy"

function getConsoleSession() {
  if [ -z "$DOPPLER_ENV" ]; then
    echo "You are required to be in a doppler environment for this"
    return 1
  fi

  # Create session JSON
  local session="{\"sessionId\":\"$AWS_ACCESS_KEY_ID\",\"sessionKey\":\"$AWS_SECRET_ACCESS_KEY\",\"sessionToken\":\"$AWS_SESSION_TOKEN\"}"

  # Get signin token from aws federation
  local signinToken
  signinToken=$(curl -s \
    "https://signin.aws.amazon.com/federation" \
    --get \
    --data-urlencode "Action=getSigninToken" \
    --data-urlencode "SessionDuration=3600" \
    --data-urlencode "Session=${session}" |
    jq -r .SigninToken)

  # Why can't we get one??
  if [ -z "$signinToken" ]; then
    echo "Failed to get signin token"
    return 1
  fi

  # Generate console URL with the sign in token
  local CONSOLE_URL="https://signin.aws.amazon.com/federation?Action=login&Destination=https://console.aws.amazon.com/&SigninToken=${signinToken}"

  # At this point, the user should not have to enter any console password.
  echo "Console URL:"
  echo "$CONSOLE_URL"
}

function doppler-te-terminal() {
  if [ -z "$1" ]; then
    echo "Usage: doppler-te-terminal <environment> [role] [mfa]"
    echo "  If role is provided, MFA is required for role assumption"
    echo "  If only MFA is provided (no role), authenticates as current user"
    return 1
  fi

  local environment=$1
  local role=$2
  local mfa_code=$3
  
  # Check if we're doing role assumption or just MFA auth
  if [ -n "$role" ] && [ -n "$mfa_code" ]; then
    # Role assumption with MFA
    doppler run --project theaterears --config $environment -- zsh -c "
      # When this shell exits, we want to preserve history
      setopt APPEND_HISTORY
      export DOPPLER_ENV=\"te($role): $environment\"
      
      # Get account and user info
      accountId=\$(aws sts get-caller-identity --query Account --output text)
      username=\$(aws sts get-caller-identity --query Arn --output text | cut -d/ -f2)
      
      # Assume the role with MFA
      export \$(printf \"AWS_ACCESS_KEY_ID=%s AWS_SECRET_ACCESS_KEY=%s AWS_SESSION_TOKEN=%s\" \$(aws sts assume-role \
        --role-arn \"arn:aws:iam::\${accountId}:role/$role\" \
        --serial-number \"arn:aws:iam::\${accountId}:mfa/\$username\" \
        --token-code \"$mfa_code\" \
        --duration-seconds 3600 \
        --role-session-name \"\$username\" \
        --query \"Credentials.[AccessKeyId,SecretAccessKey,SessionToken]\" \
        --output text))
      
      # use the latest lts version of nvm
      \. "$NVM_DIR/nvm.sh"
      nvm use --lts

      # Launch an interactive shell
      exec zsh -i
    "
  elif [ -n "$mfa_code" ] && [ -z "$role" ]; then
    # Just MFA auth as the current user (no role assumption)
    doppler run --project theaterears --config $environment -- zsh -c "
      # When this shell exits, we want to preserve history
      setopt APPEND_HISTORY
      export DOPPLER_ENV=\"te: $environment\"
      
      # Get account and user info
      username=\$(aws sts get-caller-identity --query Arn --output text | cut -d/ -f2)
      
      # Get session token with MFA
      export \$(printf \"AWS_ACCESS_KEY_ID=%s AWS_SECRET_ACCESS_KEY=%s AWS_SESSION_TOKEN=%s\" \$(aws sts get-session-token \
        --serial-number \"arn:aws:iam::\$(aws sts get-caller-identity --query Account --output text):mfa/\$username\" \
        --token-code \"$mfa_code\" \
        --duration-seconds 3600 \
        --query \"Credentials.[AccessKeyId,SecretAccessKey,SessionToken]\" \
        --output text))

      # use the latest lts version of nvm
      \. "$NVM_DIR/nvm.sh"
      nvm use --lts

      # Launch an interactive shell
      exec zsh -i
    "
  else
    echo "Error: Incorrect parameter usage"
    echo "Usage: doppler-te-terminal <environment> [role] [mfa]"
    echo "  If role is provided, MFA is required for role assumption"
    echo "  If only MFA is provided (no role), authenticates as current user"
    return 1
  fi
}
# alias te-wake="wakeonlan 50:91:e3:a5:b1:9f"
# alias te-vnc="ssh -L 5901:localhost:5901 te"
# alias te-vnc-start="ssh -L 5901:localhost:5901 te 'vncserver :1'"
#
# Ollama aliases
alias l70="ollama run llama3.3:70b"
alias cl70="ollama run codellama:70b"
alias ds32="ollama run deepseek:32b"
alias ds="ollama run deepseek-r1:8b"
alias co="ollama run deepseek-coder-v2"

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
