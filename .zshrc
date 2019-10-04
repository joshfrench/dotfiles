# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="joshfrench"

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

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

AUTO_PARAMS_SLASH=true

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(autojump brew colorize fzf gem git github npm terminalapp yarn)

source $ZSH/oh-my-zsh.sh

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

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /usr/local/opt/fzf/shell/key-bindings.zsh
source /usr/local/opt/fzf/shell/completion.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --colors "path:fg:3"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='
--no-bold
--color bg:0,hl:3,bg+:0,fg+:7,hl+:3,prompt:6,pointer:14
'
RIPGREP_CONFIG_PATH=~/dotfiles/.ripgreprc

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

alias diff=colordiff
alias cat=bat

# Load the Medium environment
[[ -f /opt/medium/env ]] && source /opt/medium/env

# Activate antibody, a zsh plugin manager (https://getantibody.github.io)
source <(antibody init)

# Enable plugins
antibody bundle caarlos0/zsh-mkc
antibody bundle mafredri/zsh-async
antibody bundle rupa/z
antibody bundle Tarrasch/zsh-bd
antibody bundle zsh-users/zsh-completions
antibody bundle zsh-users/zsh-autosuggestions

antibody bundle silverlyra/pure
antibody bundle zsh-users/zsh-syntax-highlighting
antibody bundle zsh-users/zsh-history-substring-search

antibody bundle "${MONO_HOME}/script/zsh/modules/aliases"
antibody bundle "${MONO_HOME}/script/zsh/modules/fzf"
antibody bundle "${MONO_HOME}/script/zsh/modules/history"
antibody bundle "${MONO_HOME}/script/zsh/modules/navigation"
antibody bundle "${MONO_HOME}/script/zsh/modules/okta"
antibody bundle "${MONO_HOME}/script/zsh/modules/paths"
