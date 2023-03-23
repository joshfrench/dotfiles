#!/bin/bash

_battery_status() {
  local fg=green sym='' pm pct
  pm=$(pmset -g batt)
  pct=$(echo "$pm" | perl -n -e '/(\d+)%/ && print $1')
  if [[ $pm =~ discharging ]]; then
    if (( pct >= 75 )); then
      sym='󱊣'
    elif (( pct >= 50 )); then
      sym='󱊢'
    elif (( pct >= 25 )); then
      sym='󱊡'
    else
      sym='󰂎'
    fi
  fi
  (( pct < 75 )) && fg=yellow
  (( pct < 25 )) && fg=red
  echo -n "#[fg=$fg]$sym $pct%"
}

_battery_status
