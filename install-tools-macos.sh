#!/usr/bin/env bash

set -euo pipefail

if [[ ! -d "${HOME}/.oh-my-zsh" ]]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [[ ! -d "/opt/homebrew" ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    /opt/homebrew/bin/brew shellenv >> ~/.zshrc.local
    source ~/.zshrc.local
fi

brew install stow
brew install neovim
brew install shellcheck
brew install bat
brew install ripgrep
brew install fzf
$(brew --prefix)/opt/fzf/install --key-bindings --completion --update-rc
brew install go
brew install broot
brew install fd
brew install dust
