_direnv_hook() {
  trap -- '' SIGINT;
  eval "$("${HOMEBREW_PREFIX}/bin/direnv" export zsh)";
  trap - SIGINT;
}
add-zsh-hook chpwd _direnv_hook
#add-zsh-hook precmd _direnv_hook
