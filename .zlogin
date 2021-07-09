(
  zcompare() {
    if [[ -s ${1} && ( ! -s ${1}.zwc || ${1} -nt ${1}.zwc ) ]]; then
      zcompile ${1}
    fi
  }

  zsh_plugins=$(antibody home)
  setopt EXTENDED_GLOB

  for file in ${ZDOTDIR:-${HOME}}/.zcomp^(*.zwc)(.); do
    zcompare ${file}
  done

  zcompare ${ZDOTDIR:-${HOME}}/.zshrc

  for file in ${ZMODDIR:-$(antibody home)}/**/*.zsh; do
    zcompare ${file}
  done
) &!
