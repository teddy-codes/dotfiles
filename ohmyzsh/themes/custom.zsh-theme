# Custom theme based on common theme
# Shows git status and DOPPLER_ENV if present

# Prompt symbol
CUSTOM_PROMPT_SYMBOL="❯"

# Colors
CUSTOM_COLORS_HOST_ME=green
CUSTOM_COLORS_HOST_AWS_VAULT=yellow
CUSTOM_COLORS_DOPPLER_ENV=cyan    # Color for DOPPLER_ENV display
CUSTOM_COLORS_CURRENT_DIR=blue
CUSTOM_COLORS_RETURN_STATUS_TRUE=magenta
CUSTOM_COLORS_RETURN_STATUS_FALSE=yellow
CUSTOM_COLORS_GIT_STATUS_DEFAULT=green
CUSTOM_COLORS_GIT_STATUS_STAGED=red
CUSTOM_COLORS_GIT_STATUS_UNSTAGED=yellow
CUSTOM_COLORS_GIT_PROMPT_SHA=green
CUSTOM_COLORS_BG_JOBS=yellow

# Left Prompt
PROMPT='$(custom_host)$(custom_current_dir)$(custom_bg_jobs)$(custom_return_status)'

# Right Prompt
RPROMPT='$(custom_git_status)'

# Enable redrawing of prompt variables
setopt promptsubst

# Host
custom_host() {
  local host_info=""
  
  if [[ -n $SSH_CONNECTION ]]; then
    host_info="%n@%m"
  elif [[ $LOGNAME != $USER ]]; then
    host_info="%n"
  fi
  
  if [[ -n $host_info ]]; then
    echo "%{$fg[$CUSTOM_COLORS_HOST_ME]%}$host_info%{$reset_color%}:"
  fi
  
  # Display AWS_VAULT if present
  if [[ -n $AWS_VAULT ]]; then
    echo "%{$fg[$CUSTOM_COLORS_HOST_AWS_VAULT]%}$AWS_VAULT%{$reset_color%} "
  fi
  
  # Display DOPPLER_ENV if present
  if [[ -n $DOPPLER_ENV ]]; then
    echo "%{$fg[$CUSTOM_COLORS_DOPPLER_ENV]%}⚡$DOPPLER_ENV%{$reset_color%} "
  fi
}

# Current directory
custom_current_dir() {
  echo -n "%{$fg[$CUSTOM_COLORS_CURRENT_DIR]%}%c "
}

# Prompt symbol
custom_return_status() {
  echo -n "%(?.%F{$CUSTOM_COLORS_RETURN_STATUS_TRUE}.%F{$CUSTOM_COLORS_RETURN_STATUS_FALSE})$CUSTOM_PROMPT_SYMBOL%f "
}

# Git status
custom_git_status() {
  local message=""
  local message_color="%F{$CUSTOM_COLORS_GIT_STATUS_DEFAULT}"
  
  # https://git-scm.com/docs/git-status#_short_format
  local staged=$(git status --porcelain 2>/dev/null | grep -e "^[MADRCU]")
  local unstaged=$(git status --porcelain 2>/dev/null | grep -e "^[MADRCU? ][MADRCU?]")
  
  if [[ -n ${staged} ]]; then
    message_color="%F{$CUSTOM_COLORS_GIT_STATUS_STAGED}"
  elif [[ -n ${unstaged} ]]; then
    message_color="%F{$CUSTOM_COLORS_GIT_STATUS_UNSTAGED}"
  fi
  
  local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  if [[ -n ${branch} ]]; then
    message+="${message_color}${branch}%f"
  fi
  
  echo -n "${message}"
}

# Git prompt SHA
ZSH_THEME_GIT_PROMPT_SHA_BEFORE="%{%F{$CUSTOM_COLORS_GIT_PROMPT_SHA}%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$reset_color%} "

# Background Jobs
custom_bg_jobs() {
  bg_status="%{$fg[$CUSTOM_COLORS_BG_JOBS]%}%(1j.↓%j .)"
  echo -n $bg_status
}
