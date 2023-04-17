#!/usr/bin/env zsh

setopt extendedglob

# TODO: could/should this be global rather than per-pane?
_get_ap() {
  echo "$(tmux show -pvq -t "$1" @aws-profile)"
}

tmux_aws_profile() {
  [[ -f ${HOME}/.aws/sso/cache/^botocore*.json(#qN.mh+11) ]] && return # show nothing if creds are stale
  local pane ap fg='#b58900'
  pane=$(tmux display -p '#{pane_id}')
  if [[ -n "$AWS_PROFILE" ]] && [[ -z $(_get_ap "$pane") ]]; then
    tmux set -pq -t "$pane" @aws-profile "$AWS_PROFILE"
  fi
  ap=$(_get_ap "$pane")
  if [[ -n "$ap" ]]; then
    echo -n "#[fg=$fg]󰅣 ${ap}#[default]"
  fi
}

tmux_aws_profile
