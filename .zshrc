# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

setopt correct
setopt +o nomatch

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

AUTO_PARAMS_SLASH=true

# Customize...
export EDITOR=nvim

export PATH="/usr/local/bin:$PATH"
export NODE_PATH="/usr/local/lib/node"
export USE_FUZZY_SELECT=1

alias vim=nvim
foreground-vi() {
  fg %vi
}
zle -N foreground-vi
bindkey '^Z' foreground-vi

bindkey "^K" kill-line
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey '' backward-word
bindkey '^F' forward-word

autoload -U zmv
eval "$(direnv hook $0)"

# RIPGREP_CONFIG_PATH=~/dotfiles/.ripgreprc

alias diff=colordiff
alias cat=bat
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
alias bs='bootstrap --sync'

# Load the Medium environment
[[ -f /opt/medium/env ]] && source /opt/medium/env

# autoload .nvmrc
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Activate antibody, a zsh plugin manager (https://getantibody.github.io)
source <(antibody init)

# Enable plugins
antibody bundle mafredri/zsh-async
# antibody bundle agkozak/zsh-z
antibody bundle zsh-users/zsh-completions
antibody bundle zsh-users/zsh-autosuggestions

# antibody bundle silverlyra/pure
antibody bundle zsh-users/zsh-syntax-highlighting
antibody bundle zsh-users/zsh-history-substring-search

antibody bundle "${MONO_HOME}/script/zsh/modules/aliases"
antibody bundle "${MONO_HOME}/script/zsh/modules/fzf"
antibody bundle "${MONO_HOME}/script/zsh/modules/history"
antibody bundle "${MONO_HOME}/script/zsh/modules/navigation"
antibody bundle "${MONO_HOME}/script/zsh/modules/okta"
# antibody bundle "${MONO_HOME}/script/zsh/modules/paths"
antibody bundle "~/dotfiles/zsh/modules/autojump"
