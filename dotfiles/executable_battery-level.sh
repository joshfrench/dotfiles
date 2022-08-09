#!/bin/bash

percent=$(pmset -g batt | tail +2 | ack '(\d+)%' --output '$1')
charging='#[bg=yellow]'
[[ $(pmset -g ac) =~ 'No adapter' ]] || charging='#[bg=green]'
[[ $percent -gt 15 ]] || warning='#[bg=red]'
echo -n "$warning$charging $percent%"
