#!/bin/bash

percent=$(pmset -g batt | tail +2 | ack '(\d+)%' --output '$1')
charging='#[bg=green]'
[[ $(pmset -g ac) =~ 'No adapter' ]] || charging='#[bg=yellow]'
[[ $percent -gt 15 ]] || warning='#[bg=red]'
echo -n "$warning$charging $percent%"
