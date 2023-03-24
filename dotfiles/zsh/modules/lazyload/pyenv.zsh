if [ $commands[pyenv] ]; then
  __pyenv() { # _pyenv already used by completions
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

  pyenv() {
    PATH="$(bash --norc -ec 'IFS=:; paths=($PATH); for i in ${!paths[@]}; do if [[ ${paths[i]} == "'/Users/josh/.pyenv/shims'" ]]; then unset '\''paths[i]'\''; fi; done; echo "${paths[*]}"')"
    export PATH="${HOMEBREW_CELLAR}/pyenv-virtualenv/$(__pyenv virtualenv --version | cut -d' ' -f2)/shims:/Users/josh/.pyenv/shims:${PATH}"
    export PYENV_ROOT="$HOME/.pyenv"
    export PYENV_SHELL=zsh
    export PYENV_VIRTUALENV_INIT=1
    source "${HOMEBREW_CELLAR}/pyenv/$(__pyenv --version | cut -d' ' -f2)/completions/pyenv.zsh"

    command pyenv rehash 2>/dev/null

    unfunction "$0"
    alias pyenv=__pyenv

    __pyenv "$@"
  }
fi
