#
# Configure fzf
#

# brew_prefix=$(brew --prefix)
brew_prefix='/usr/local'

# Auto-completion
fzf_completion=$brew_prefix/opt/fzf/shell/completion.zsh
if ! [ -f $fzf_completion ]; then
    fzf_completion=$(brew --prefix fzf)/shell/completion.zsh
fi
[[ $- == *i* ]] && source $fzf_completion 2> /dev/null

# Key bindings
fzf_bindings=$brew_prefix/opt/fzf/shell/key-bindings.zsh
if ! [ -f $fzf_bindings ]; then
    fzf_bindings=$(brew --prefix fzf)/shell/key-bindings.zsh
fi
source $fzf_bindings

unset brew_prefix
unset fzf_completion
unset fzf_bindings
