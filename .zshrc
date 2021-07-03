# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
export CONFIDENT_JIRA_BRANCH=1

# aliases -> modules/aliases

foreground-vi() {
  fg %nvi
}
zle -N foreground-vi
bindkey '^Z' foreground-vi

bindkey "^K" kill-line
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey '' backward-word
bindkey '^F' forward-word

autoload -U zmv
autoload -Uz compinit
compinit
eval "$(direnv hook $0)"

# RIPGREP_CONFIG_PATH=~/dotfiles/.ripgreprc

# Load the Medium environment
[[ -f /opt/medium/env ]] && source /opt/medium/env

# Activate antibody, a zsh plugin manager (https://getantibody.github.io)
source <(antibody init)

# Enable plugins
antibody bundle mafredri/zsh-async
# antibody bundle agkozak/zsh-z
antibody bundle zsh-users/zsh-completions
antibody bundle zsh-users/zsh-autosuggestions

# antibody bundle silverlyra/pure
antibody bundle romkatv/powerlevel10k
antibody bundle zsh-users/zsh-syntax-highlighting
antibody bundle zsh-users/zsh-history-substring-search

antibody bundle "${MONO_HOME}/script/zsh/modules/aliases"
antibody bundle "${MONO_HOME}/script/zsh/modules/fzf"
antibody bundle "${MONO_HOME}/script/zsh/modules/history"
antibody bundle "${MONO_HOME}/script/zsh/modules/navigation"
antibody bundle "${MONO_HOME}/script/zsh/modules/okta"
# antibody bundle "${MONO_HOME}/script/zsh/modules/paths"
antibody bundle "~/dotfiles/zsh/modules/autojump"
antibody bundle "~/dotfiles/zsh/modules/kubeps"
antibody bundle "~/dotfiles/zsh/modules/aliases"

source <(kubectl completion zsh)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
