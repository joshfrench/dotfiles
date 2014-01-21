#!/bin/bash

percent=$(pmset -g batt | tail +2 | ack '(\d+)%' --output '$1')
[[ $(pmset -g ac) =~ 'No adapter' ]] || charging='⚡︎'
[[ $percent -gt 15 ]] || warning='#[fg=brightred]'
echo -n "$warning$charging$percent"
