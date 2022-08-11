#!/bin/bash
set -eu

_battery_status() {
  local bg pm pct
  bg=green
  pm=$(pmset -g batt)
  pct=$(echo "$pm" | perl -n -e '/(\d+)%/ && print $1')
  [[ $pm =~ discharging ]] && bg=yellow
  [[ $pct -le 15 ]] && bg=red
  echo -n "#[bg=$bg] $pct%"
}

_battery_status
