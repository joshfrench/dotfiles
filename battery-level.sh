#!/bin/bash

percent=$(pmset -g batt | tail +2 | ack '(\d+)%' --output '$1')
if [[ $percent -lt 16 ]]; then
  echo -n "#[fg=brightred]"
fi
echo -n "⚡︎$percent"
