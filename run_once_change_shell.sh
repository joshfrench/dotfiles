#!/bin/sh
echo "Enter password to allow chezmoi to change default shell to ${HOMEBREW_PREFIX}/bin/zsh:"
sudo bash -c "echo ${HOMEBREW_PREFIX}/bin/zsh >> /etc/shells"
chsh -s "${HOMEBREW_PREFIX}/bin/zsh"
