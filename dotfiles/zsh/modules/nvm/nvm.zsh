_activate_nvm() {
  local YELLOW="\e[33m"
  local NC="\e[0m"

  if [[ -f './.nvmrc' ]]; then
    nvm=$(cat ./.nvmrc)
    if [[ ! -v NVM_BIN ]]; then
      read -q "?$(echo ${YELLOW}.nvmrc found, use ${nvm}?${NC}) (y/N) " && echo '' && nvm use ${nvm}
    elif [ ! $(nvm current) = ${nvm} ]; then
      read -q "?$(echo ${YELLOW}using node $(nvm current), use ${nvm} instead?${NC}) (y/N) " && echo '' && nvm use ${nvm}
    fi
  fi
}

add-zsh-hook chpwd _activate_nvm
