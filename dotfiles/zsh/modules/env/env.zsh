export EDITOR=nvim
AUTO_PARAMS_SLASH=true
export PYENV_SHELL=zsh

export LSCOLORS="exgxBxdxcxegaxabagacad"
export LS_COLORS='di=34;40:ln=36;40:so=1;;40:pi=33;40:ex=32;40:bd=34;46:cd=0;40:su=0;41:sg=0;46:tw=0;42:ow=0;43:'

PURE_GIT_PULL=0
PURE_PROMPT_SYMBOL='%%'
PURE_PROMPT_VICMD_SYMBOL=">"
PURE_NEWLINE=1

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=11'

export PISTOL_CHROMA_FORMATTER=terminal16m
export PISTOL_CHROMA_STYLE=solarized-dark

# ./private.zsh is gitignored; store privileged items there
private=./private.zsh
[ -f $private ] && source $private
