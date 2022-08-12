export EDITOR=nvim
AUTO_PARAMS_SLASH=true
export PYENV_SHELL=zsh

export RIPGREP_CONFIG_PATH=~/.ripgreprc

PURE_GIT_PULL=0
PURE_PROMPT_SYMBOL='%%'
PURE_PROMPT_VICMD_SYMBOL=">"
PURE_NEWLINE=1

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=11'

# ./private.zsh is gitignored; store privileged items there
private=./private.zsh
[ -f $private ] && source $private
