#!/bin/bash

_battery_status() {
  local fg pm pct
  fg=green
  pm=$(pmset -g batt)
  pct=$(echo "$pm" | perl -n -e '/(\d+)%/ && print $1')
  [[ $pm =~ discharging ]] && fg=yellow
  [[ $pct -le 15 ]] && fg=red
  echo -n "#[fg=$fg]$pct%"
}

_battery_status
