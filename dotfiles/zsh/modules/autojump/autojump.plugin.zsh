__j() { # replace upstream j() with a version that doesn't do shitty colorization
  if [[ ${1} == -* ]] && [[ ${1} != "--" ]]; then
      autojump ${@}
      return
  fi

  setopt localoptions noautonamedirs
  local output="$(autojump ${@})"
  if [[ -d "${output}" ]]; then
      if [ -t 1 ]; then  # if stdout is a terminal, use colors
              echo -e "\\033[0;34m${output}\\033[0m"
      else
              echo -e "${output}"
      fi
      cd "${output}"
  else
      echo "autojump: directory '${@}' not found"
      echo "\n${output}\n"
      echo "Try \`autojump --help\` for more information."
      false
  fi
}

j() {
 [ -f ${HOMEBREW_PREFIX}/etc/profile.d/autojump.sh ] && . ${HOMEBREW_PREFIX}/etc/profile.d/autojump.sh
  unset -f j
  alias j=__j
  __j "$@"
}
