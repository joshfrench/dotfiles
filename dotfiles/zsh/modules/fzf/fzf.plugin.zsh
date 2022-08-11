#
# Configure fzf
#

# Auto-completion
fzf_completion=$HOMEBREW_PREFIX/opt/fzf/shell/completion.zsh
if ! [ -f $fzf_completion ]; then
    fzf_completion=$HOMEBREW_PREFIX/opt/fzf/shell/completion.zsh
fi
[[ $- == *i* ]] && source $fzf_completion 2> /dev/null

# Key bindings
fzf_bindings=$HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.zsh
if ! [ -f $fzf_bindings ]; then
    fzf_bindings=$HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.zsh
fi
source $fzf_bindings

unset fzf_completion
unset fzf_bindings

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
    --cycle
    --layout=reverse
  "
}

_gen_fzf_default_opts
