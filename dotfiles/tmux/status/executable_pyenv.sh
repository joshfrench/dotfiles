#!/bin/bash

tmux_show_pyenv() {
  local pyenv_name=${PYENV_VIRTUAL_ENV##*/}
  local pyenv="${pyenv_name:-$(tmux show -pqv -t "$(tmux display -p '#{pane_id}')" @pyenv-name)}"
  if [[ -n "$pyenv" ]]; then
    echo -n "#[fg=#859900] ${pyenv}#[default]"
  fi
}

tmux_show_pyenv
