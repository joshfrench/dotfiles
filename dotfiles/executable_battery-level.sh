#!/bin/bash

percent=$(pmset -g batt | rg '\d+%' --only-matching)
charging='#[bg=yellow]'
[[ $(pmset -g ac) =~ 'No adapter' ]] || charging='#[bg=green]'
[[ $percent -gt 15 ]] || warning='#[bg=red]'
echo -n "$warning$charging $percent"
