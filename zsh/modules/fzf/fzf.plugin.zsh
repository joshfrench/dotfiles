#
# Configure fzf
#

# brew_prefix=$(brew --prefix)
brew_prefix='/usr/local'

# Auto-completion
fzf_completion=$brew_prefix/opt/fzf/shell/completion.zsh
if ! [ -f $fzf_completion ]; then
    fzf_completion=/usr/local/opt/fzf/shell/completion.zsh
fi
[[ $- == *i* ]] && source $fzf_completion 2> /dev/null

# Key bindings
fzf_bindings=$brew_prefix/opt/fzf/shell/key-bindings.zsh
if ! [ -f $fzf_bindings ]; then
    fzf_bindings=/usr/local/opt/fzf/shell/key-bindings.zsh
fi
source $fzf_bindings

unset brew_prefix
unset fzf_completion
unset fzf_bindings

_gen_fzf_default_opts() {
  local base03='#002b36'
  local base02='#073642'
  local base0='#839496'
  local base2='#eee8d5'
  local yellow='#b58900'
  local green='#859900'
  local cyan='#2aa198'
  local blue='#268bd2'

  export FZF_DEFAULT_OPTS="
    --color=bg+:$base02,bg:$base03,spinner:$green,hl:$blue
    --color=fg:$base0,header:$blue,info:$yellow,pointer:$cyan
    --color=marker:$cyan,fg+:$base2,prompt:$yellow,hl+:$blue
    --color=gutter:$base03
    --cycle
    --layout=reverse
    --preview='bat --style=numbers --color=always --line-range :500 {}'
  "
}

_gen_fzf_default_opts
