#!/usr/bin/env zsh

tmux_status() {
  local pyenv aws kubectx battery
  typeset -a segments

  pyenv=$(~/dotfiles/tmux/status/pyenv.sh)
  aws=$(~/dotfiles/tmux/status/aws.sh)
  kubectx=$(~/dotfiles/tmux/status/kubectx.sh)
  battery=$(~/dotfiles/tmux/status/battery.sh)

  [[ -n "$pyenv" ]]   && segments+=$pyenv
  [[ -n "$aws" ]]     && segments+=$aws
  [[ -n "$kubectx" ]] && segments+=$kubectx
  [[ -n "$battery" ]] && segments+=$battery

  echo -n "${(j.  .)segments}"
}

tmux_status
