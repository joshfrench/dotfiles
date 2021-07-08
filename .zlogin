setopt prompt_subst

autoload -Uz add-zsh-hook
autoload -U promptinit; promptinit
prompt pure

PURE_GIT_PULL=0
PURE_PROMPT_SYMBOL='%%'
PURE_PROMPT_VICMD_SYMBOL=">"
PURE_NEWLINE=1
zstyle :prompt:pure:prompt:success color green

export LSCOLORS="exgxBxdxcxegaxabagacad"
export LS_COLORS='di=34;40:ln=36;40:so=1;;40:pi=33;40:ex=32;40:bd=34;46:cd=0;40:su=0;41:sg=0;46:tw=0;42:ow=0;43:'

if [ $ITERM_SESSION_ID ]; then
precmd() {
  echo -ne "\033]0;${PWD#*/*/*/*/*/}\007"
}
fi

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=11'

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
