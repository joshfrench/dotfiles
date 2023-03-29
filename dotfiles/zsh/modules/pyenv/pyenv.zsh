_activate_pyenv() {
  local GREEN="\033[0;32m"
  local NC="\033[0;0m"

  # if [[ -d './.venv' ]]; then
  #   [[ -v VIRTUAL_ENV ]] || echo -e "${GREEN}🐍 Run '. .venv/bin/activate' to load venv.${NC}"
  # elif [[ -f './Pipfile' ]]; then
  #   [[ -v PIPENV_ACTIVE ]] || echo -e "${GREEN}🐍 Run 'pipenv shell' to load Pipenv.${NC}"
  if [[ -f './.python-version' ]]; then
    pyenv=$(cat ./.python-version)
    if [[ ! -v PYENV_VIRTUAL_ENV ]]; then
      read -q "?$(echo ${GREEN}.python-version found, activate ${pyenv}?${NC}) (y/N) " && pyenv activate $pyenv
    elif [ ! ${PYENV_VIRTUAL_ENV##*/} = ${pyenv} ]; then
      read -q "?$(echo $GREEN)pyenv is ${PYENV_VIRTUAL_ENV##*/}, activate ${pyenv} instead? (y/N) " && pyenv activate $pyenv
    fi
  elif [ -f './requirements.txt' ] || [ -f './requirements.yml' ]; then
    if read -q "yn?$(echo "${GREEN}No pyenv created, run \`make pyenv\`?${NC} (y/N)") "; then
      echo ''
      make pyenv
      pyenv activate $(cat ./.python-version)
      pyenv pyright
      echo "\n${GREEN}Next: aws sso and \`make deps\`.${NC}"
    fi
  fi
}

add-zsh-hook chpwd _activate_pyenv
