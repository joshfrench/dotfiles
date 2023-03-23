#!/bin/bash

tmux_show_pyenv() {
  local pyenv
  pyenv="$(tmux show -pqv -t "$(tmux display -p '#{pane_id}')" @pyenv-name)"
  if [[ -n "$pyenv" ]]; then
    echo -n "#[fg=#859900] ${pyenv}#[default]"
  fi
}

tmux_show_pyenv
