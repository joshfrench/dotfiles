(( $+commands[kubectl] )) || return
(( $+functions[compdef] )) || return

kubectl() {
  unfunction "$0"
  if [[ -o interactive  ]]; then
    source <(kubectl completion zsh)
    compdef k=kubectl
  fi
  $0 "$@"
}
