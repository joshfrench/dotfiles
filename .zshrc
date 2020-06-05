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

export FZF_DEFAULT_COMMAND='rg --files --hidden --colors "path:fg:blue"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='
--no-bold
--color hl:3,hl+:3,bg+:8,prompt:6,pointer:4
'
RIPGREP_CONFIG_PATH=~/dotfiles/.ripgreprc

alias diff=colordiff
alias cat=bat
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'

# Load the Medium environment
[[ -f /opt/medium/env ]] && source /opt/medium/env

# Activate antibody, a zsh plugin manager (https://getantibody.github.io)
source <(antibody init)

# Enable plugins
antibody bundle mafredri/zsh-async
antibody bundle agkozak/zsh-z
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
