#!/bin/bash

percent=$(pmset -g batt | tail +2 | ack '(\d+)%' --output '$1')
power='#[bg=green]'
[[ $(pmset -g ac) =~ 'No adapter' ]] || charging='#[bg=lightblue]'
[[ $percent -gt 15 ]] || power='#[bg=red]'
echo -n "$power $percent%"
