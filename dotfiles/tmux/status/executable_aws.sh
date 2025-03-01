#!/usr/bin/env zsh

setopt extendedglob

_get_ap() {
  echo "$(tmux show -vq @aws-profile)"
}

tmux_aws_profile() {
  local ap fg='#b58900' icon='󰅣'
  if [[ -n "$AWS_PROFILE" ]] && [[ -z $(_get_ap) ]]; then
    tmux set -q @aws-profile "$AWS_PROFILE"
  fi
  ap=$(_get_ap)
  if [[ -n "$ap" ]]; then
    if [[ "$ap" == *production* ]]; then
      fg='#cb4b16'
      icon='󰅟'
    fi
    [[ -f ${HOME}/.aws/sso/cache/*.json(#qN.mh-11) ]] || color="#586e75" # indicate stale creds
    echo -n "#[fg=$fg]${icon} ${ap}#[default]"
  fi
}

tmux_aws_profile
