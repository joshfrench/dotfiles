if [ $commands[pyenv] ]; then
  pyenv() {
    unfunction "$0"

    source "${HOMEBREW_PREFIX}/Cellar/pyenv/2.2.5/completions/pyenv.zsh"
    command pyenv rehash 2>/dev/null
    local command
    command="${1:-}"
    if [ "$#" -gt 0 ]; then
      shift
    fi

    case "$command" in
    rehash|shell)
      eval "$(pyenv "sh-$command" "$@")"
      ;;
    *)
      command pyenv "$command" "$@"
      ;;
    esac
  }
fi
