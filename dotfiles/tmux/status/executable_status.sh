#!/usr/bin/env zsh

tmux_status() {
  declare -a outputs
  declare -a segments=(pyenv aws kubectx battery)

  for segment in $segments; do
    output="$(~/dotfiles/tmux/status/${segment}.sh)"
    [[ -n "$output" ]] && outputs+="$output"
  done

  echo -n "${(j.  .)outputs}"
}

tmux_status
