(
  # if no .zwc or base is newer, compile
  zcompare() {
    if [[ -s ${1} && ( ! -s ${1}.zwc || ${1} -nt ${1}.zwc) ]]; then
      zcompile ${1}
    fi
  }

  zcompare ${ZDOTDIR:-${HOME}}/.{zcompdump,zshrc}

  for file in ~/dotfiles/zsh/modules/**/*.zsh; do
    zcompare ${file}
  done

  for file in ~/Library/Caches/antibody/**/*.zsh; do
    zcompare ${file}
  done
) &!
