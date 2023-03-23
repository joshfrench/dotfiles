#!/usr/bin/env bash

tmux_aws_profile() {
  local ap
  ap="$(tmux show -pvq -t "$(tmux display -p '#{pane-id}')" @aws-profile)"
  if [[ -n "$ap" ]]; then
    echo -n "#[fg=#b58900]󰅣 ${ap}#[default]"
  fi

}

tmux_aws_profile
