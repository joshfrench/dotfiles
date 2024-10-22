if [ $commands[kubectl] ]; then
  kubectl() {
    unfunction "$0"
    source <(kubectl completion zsh)
    compdef k='kubectl'
    $0 "$@"
  }
fi
