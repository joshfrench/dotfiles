GREEN="\033[0;32m"
NC="\033[0;0m"

activate_pyenv() {
  if [[ -d './.venv' ]]; then
    echo -e "${GREEN}Run '. .venv/bin/activate' to load venv${NC}"
  elif [[ -f './Pipfile' ]]; then
    echo -e "${GREEN}Run 'pipenv shell' to load Pipenv${NC}"
  elif [ -f './requirements.txt' ] || [ -f './requirements.yml' ]; then
    echo -e "${GREEN}No venv found; create with 'python -m venv .venv'${NC}"
  fi
}
