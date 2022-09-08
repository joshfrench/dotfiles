#!/bin/bash

brew_url=https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
echo "Installing homebrew from ${brew_url}"
exec bash -c "$(curl -fsSL ${brew_url})"
