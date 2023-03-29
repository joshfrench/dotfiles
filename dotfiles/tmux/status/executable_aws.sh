#!/usr/bin/env bash

# TODO: could/should this be global rather than per-pane?
_get_ap() {
  echo "$(tmux show -pvq -t "$1" @aws-profile)"
}

tmux_aws_profile() {
  local pane ap
  pane=$(tmux display -p '#{pane_id}')
  if [[ -n "$AWS_PROFILE" ]] && [[ -z $(_get_ap "$pane") ]]; then
    tmux set -pq -t "$pane" @aws-profile "$AWS_PROFILE"
  fi
  ap=$(_get_ap "$pane")
  if [[ -n "$ap" ]]; then
    echo -n "#[fg=#b58900]󰅣 ${ap}#[default]"
  fi
}

tmux_aws_profile
