#!/bin/sh
bat --color=always --style=numbers --pager=never --wrap=never --terminal-width="$2" --line-range :"$3" "$1"
