(( ${+commands[kubectl]} )) && alias kubectl='test -z $C_KUBE && C_KUBE=1 && source <(command kubectl completion zsh); command kubectl'
