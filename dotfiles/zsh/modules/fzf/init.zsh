#
# Configure fzf
#

# Auto-completion
fzf_completion=$HOMEBREW_PREFIX/opt/fzf/shell/completion.zsh
if ! [ -f $fzf_completion ]; then
    fzf_completion=$(brew --prefix fzf)/shell/completion.zsh
fi
[[ $- == *i* ]] && source $fzf_completion 2> /dev/null

# Key bindings
fzf_bindings=$HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.zsh
if ! [ -f $fzf_bindings ]; then
    fzf_bindings=$(brew --prefix fzf)/shell/key-bindings.zsh
fi
source $fzf_bindings

unset fzf_completion
unset fzf_bindings
