if [ $commands[pyenv] ]; then
  pyenv() {
    unfunction "$0"

    PATH="$(bash --norc -ec 'IFS=:; paths=($PATH); for i in ${!paths[@]}; do if [[ ${paths[i]} == "'/Users/josh/.pyenv/shims'" ]]; then unset '\''paths[i]'\''; fi; done; echo "${paths[*]}"')"
    export PATH="/Users/josh/.pyenv/shims:${PATH}"
    export PYENV_SHELL=zsh
    source '/usr/local/Cellar/pyenv/2.3.3/libexec/../completions/pyenv.zsh'

    command pyenv rehash 2>/dev/null

    local command
    command="${1:-}"
    if [ "$#" -gt 0 ]; then
      shift
    fi

    case "$command" in
    activate|deactivate|rehash|shell)
      eval "$(pyenv "sh-$command" "$@")"
      ;;
    *)
      command pyenv "$command" "$@"
      ;;
    esac
  }
fi
