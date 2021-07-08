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

# disabled for speed; medium doesn't use
# eval "$(direnv hook $0)"

# RIPGREP_CONFIG_PATH=~/dotfiles/.ripgreprc

# Load the Medium environment
[[ -f /opt/medium/env ]] && source /opt/medium/env

# Activate antibody, a zsh plugin manager (https://getantibody.github.io)
source ~/.zsh_plugins.sh

kubectl() {
  unset -f kubectl
  if ! type __start_kubectl >/dev/null 2>&1; then
    source <(kubectl completion zsh)
  fi

  kubectl "$@"
}

setopt prompt_subst

autoload -Uz add-zsh-hook

PURE_GIT_PULL=0
PURE_PROMPT_SYMBOL='%%'
PURE_PROMPT_VICMD_SYMBOL=">"
PURE_NEWLINE=1
zstyle :prompt:pure:prompt:success color green

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=11'

export LSCOLORS="exgxBxdxcxegaxabagacad"
export LS_COLORS='di=34;40:ln=36;40:so=1;;40:pi=33;40:ex=32;40:bd=34;46:cd=0;40:su=0;41:sg=0;46:tw=0;42:ow=0;43:'

_gen_fzf_default_opts() {
  local color00='#002b36'
  local color01='#073642'
  local color02='#586e75'
  local color03='#657b83'
  local color04='#839496'
  local color05='#93a1a1'
  local color06='#eee8d5'
  local color07='#fdf6e3'
  local color08='#dc322f'
  local color09='#cb4b16'
  local color0A='#b58900'
  local color0B='#859900'
  local color0C='#2aa198'
  local color0D='#268bd2'
  local color0E='#6c71c4'
  local color0F='#d33682'

  export FZF_DEFAULT_OPTS="
    --color=bg+:$color01,bg:$color00,spinner:$color0B,hl:$color0D
    --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C
    --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D
    --color=gutter:$color00
  "
}

_gen_fzf_default_opts

autoload -Uz compinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
	compinit;
else
	compinit -C;
fi
# zprof
