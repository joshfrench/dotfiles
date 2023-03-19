#!/usr/bin/env bash

init(){
  tmux set-option -goq @tmux_kubecontext_status_config ""
  tmux set-option -goq @tmux_kubecontext_status_error ""
}

set_tmux_option(){
  tmux set-option -gq "$1" "$2"
}

get_tmux_option(){
  tmux show-option -gqv "$1"
}

get_kubectx_color() {
  case $(get_status_config) in
    lucid-production-*)
      echo "#dc322f"
      ;;
    lucid-staging-*)
      echo '#2aa198'
      ;;
    *)
      echo '#6c71c4'
      ;;
  esac
}

set_status_config(){
  set_tmux_option "@tmux_kubecontext_status_config" "$1"
}

get_status_config(){
  get_tmux_option "@tmux_kubecontext_status_config"
}

get_status_error(){
  get_tmux_option "@tmux_kubecontext_status_error"
}

set_status_error(){
  set_tmux_option "@tmux_kubecontext_status_error" "$1"
}

clear_status_error(){
  set_tmux_option "@tmux_kubecontext_status_error" ""
}

reset_context(){
  set_status_config ""
}

update_context(){
  local config exitcode=0
  if [[ ! -x "$(command -v /usr/local/bin/kubectl)" ]]; then
    set_status_error "executable kubectl command was not found"
    return
  fi

  config=$(/usr/local/bin/kubectl config view --minify -o jsonpath='{.current-context}/{..namespace}' 2>/dev/null)
  exitcode=$?
  if [[ -z "${config}" ]] || [[ $exitcode != 0 ]]; then
    set_status_error "failed to get config with kubectl"
    return
  fi
  set_status_config "$config"

  clear_status_error
}

main() {
  init
  update_context

  local result config color error

  config=$(get_status_config)
  color=$(get_kubectx_color)
  error=$(get_status_error)

  result="#[fg=${color}]󱃾 ${config%/default}"

  if [[ -n ${error} ]]; then
    result=" #[fg=#dc322f]${error}#[default]"
  fi

  echo -n "${result}"
}

main
