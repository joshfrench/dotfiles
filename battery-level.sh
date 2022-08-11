#!/bin/bash
set -eu

_battery_status() {
  local bg percent
  bg=green
  percent=$(pmset -g batt | rg '(\d+)%' --only-matching -r '$1')
  [[ $(pmset -g ac) =~ 'No adapter' ]] && bg=yellow
  [[ $percent -le 15 ]] && bg=red
  echo -n "#[bg=$bg] $percent%"
}

_battery_status
