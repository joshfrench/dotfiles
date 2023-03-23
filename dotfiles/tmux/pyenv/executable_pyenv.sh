#!/bin/bash

tmux_show_pyenv() {
  local pyenv
  pyenv="$(tmux show -pv -t "$(tmux display -p '#{pane_id}')" @pyenv-name)"
  if [[ -n "$pyenv" ]]; then
    echo -n "#[fg=green] ${pyenv}#[default]"
  fi
}

tmux_show_pyenv
