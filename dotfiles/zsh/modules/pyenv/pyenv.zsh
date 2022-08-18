_activate_pyenv() {
  local GREEN="\033[0;32m"
  local NC="\033[0;0m"

  if [[ -d './.venv' ]]; then
    [[ -v VIRTUAL_ENV ]] || echo -e "${GREEN}🐍 Run '. .venv/bin/activate' to load venv.${NC}"
  elif [[ -f './Pipfile' ]]; then
    [[ -v PIPENV_ACTIVE ]] || echo -e "${GREEN}🐍 Run 'pipenv shell' to load Pipenv.${NC}"
  elif [[ -f './.python-version' ]]; then
    [[ ! -v PYENV_VIRTUAL_ENV ]] && \
      read -q "?$(echo -e ${GREEN}.python-version found, run \`pyenv activate\`?${NC}) (N/y) " && \
      pyenv activate
  elif [ -f './requirements.txt' ] || [ -f './requirements.yml' ]; then
    echo -e "${GREEN}🐍 No venv found; create with 'python -m venv .venv'.${NC}"
  fi
}

typeset -ag chpwd_functions;
if [[ -z "${chpwd_functions[(r)_activate_pyenv]+1}" ]]; then
  chpwd_functions+=_activate_pyenv
fi
