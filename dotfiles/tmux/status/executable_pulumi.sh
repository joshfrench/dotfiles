#!/usr/bin/env zsh

init(){
  tmux set-option -opq @tmux_pulumi_stack ""
}

set_tmux_option(){
  tmux set-option -qp "$1" "$2"
}

get_tmux_option(){
  tmux show-option -pqv "$1"
}

set_status(){
  set_tmux_option "@tmux_pulumi_stack" "$1"
}

get_status(){
  get_tmux_option "@tmux_pulumi_stack"
}

update_context(){
  local exitcode=0
  typeset -a stack

  if [[ ! -x "$(command -v /usr/local/bin/pulumi)" ]]; then
    return
  fi

  set_status $(pulumi stack -C $(tmux display -p '#{pane_current_path}') --show-name --non-interactive)
}

get_pulumi_stack_color() {
  case $1 in
    *production*)
      echo "#d33682"
      ;;
    *staging*)
      echo '#6c71c4'
      ;;
    *)
      echo '#268bd2'
      ;;
  esac
}

main() {
  init
  update_context

  local stack color

  stack=$(get_status)
  color=$(get_pulumi_stack_color $stack)

  [[ -n "$stack" ]] && echo -n "#[fg=${color}]󰆧 ${stack}"
}

main
