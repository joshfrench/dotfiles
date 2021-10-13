# zmodload zsh/zprof
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

setopt correct extendedglob
setopt +o nomatch
setopt prompt_subst

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

AUTO_PARAMS_SLASH=true

# Customize...
export EDITOR=nvim

export NODE_PATH="/usr/local/lib/node"
export GOPATH=$HOME/go
export PATH="/usr/local/bin:/usr/local/sbin:$PATH:${GOROOT}/bin"

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

# RIPGREP_CONFIG_PATH=~/dotfiles/.ripgreprc

# Activate antibody, a zsh plugin manager (https://getantibody.github.io)
source ~/.zsh_plugins.sh
private=${HOME}/zsh/modules/private/private.zsh
[ -f $private ] && source $private

autoload -Uz add-zsh-hook

PURE_GIT_PULL=0
PURE_PROMPT_SYMBOL='%%'
PURE_PROMPT_VICMD_SYMBOL=">"
PURE_NEWLINE=1
zstyle :prompt:pure:prompt:success color green

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=11'

export LSCOLORS="exgxBxdxcxegaxabagacad"
export LS_COLORS='di=34;40:ln=36;40:so=1;;40:pi=33;40:ex=32;40:bd=34;46:cd=0;40:su=0;41:sg=0;46:tw=0;42:ow=0;43:'

autoload -Uz compinit
if [[ -n ${ZDOTDIR:-${HOME}}/.zcompdump(#qN.m+1) ]]; then
  compinit
  touch ${ZDOTDIR:-${HOME}}/.zcompdump
else
  compinit -C
fi
# zprof
