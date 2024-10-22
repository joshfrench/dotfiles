#!/usr/bin/env zsh

init(){
  tmux set-option -goq @tmux_kubecontext_status_config ""
}

set_tmux_option(){
  tmux set-option -gq "$1" "$2"
}

get_tmux_option(){
  tmux show-option -gqv "$1"
}

get_kubectx_color() {
  case $(get_status_config) in
    lucid-production-* | vivid-production-*)
      echo "#d33682"
      ;;
    lucid-staging-*  | vivid-staging-*)
      echo '#2aa198'
      ;;
    *)
      echo '#6c71c4'
      # echo '#268bd2'
      ;;
  esac
}

set_status_config(){
  set_tmux_option "@tmux_kubecontext_status_config" "$1"
}

get_status_config(){
  get_tmux_option "@tmux_kubecontext_status_config"
}

reset_context(){
  set_status_config ""
}

update_context(){
  local exitcode=0
  typeset -a config
  if [[ ! -x "$(command -v ${HOMEBREW_PREFIX}/bin/kubectl)" ]]; then
    return
  fi

  config=($(${HOMEBREW_PREFIX}/bin/kubectl config view --minify -o jsonpath='{.current-context} {..namespace}')) 2>/dev/null
  exitcode=$?
  if [[ ${#config[@]} -eq 0 ]] || [[ $exitcode != 0 ]]; then
    return
  fi
  set_status_config "${(j./.)config}"
}

main() {
  init
  update_context

  local config color

  config=$(get_status_config)
  color=$(get_kubectx_color)

  [[ -n "$config" ]] && echo -n "#[fg=${color}]󱃾 ${config%/default}"
}

main
