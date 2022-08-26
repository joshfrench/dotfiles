_activate_pyenv() {
  local GREEN="\033[0;32m"
  local NC="\033[0;0m"

  # if [[ -d './.venv' ]]; then
  #   [[ -v VIRTUAL_ENV ]] || echo -e "${GREEN}🐍 Run '. .venv/bin/activate' to load venv.${NC}"
  # elif [[ -f './Pipfile' ]]; then
  #   [[ -v PIPENV_ACTIVE ]] || echo -e "${GREEN}🐍 Run 'pipenv shell' to load Pipenv.${NC}"
  if [[ -f './.python-version' ]]; then
    [[ ! -v PYENV_VIRTUAL_ENV ]] && \
      read -q "?$(echo -e ${GREEN}.python-version found, run \`pyenv activate\`?${NC}) (y/N) " && \
      pyenv activate
  elif [ -f './requirements.txt' ] || [ -f './requirements.yml' ]; then
    if read -q "yn?$(echo -e "${GREEN}No pyenv created, run \`make pyenv\`?${NC} (y/N)") "; then
      echo "\n"
      make pyenv
      pyenv activate
      echo "\n${GREEN}Next: aws sso and \`make deps\`.${NC}"
    fi
  fi
}

typeset -ag chpwd_functions;
if [[ -z "${chpwd_functions[(r)_activate_pyenv]+1}" ]]; then
  chpwd_functions+=_activate_pyenv
fi
