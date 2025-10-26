#!/usr/bin/env bash
set -ueo pipefail
set -x

xcode-select --install

# Set up passwordless sudo:
# sudo visudo
# %admin ALL = (ALL) NOPASSWD: ALL

which brew || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# for Python that works with fastai:
brew install python
# then follow https://pnote.eu/notes/fastai-pytorch-mac-setup/

# AI:
brew install --cask anaconda
brew install --cask lm-studio
brew install ollama
brew install --cask superwhisper

# show hidden files:
defaults write com.apple.Finder AppleShowAllFiles true
killall Finder

brew install powerlevel10k

brew install ollama

brew install gh  # github cli

brew install ripgrep

brew install --cask iterm2

brew install --cask visual-studio-code
code_cmd="/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code"
[ -r "$code_cmd" ] && ln -s "$code_cmd" "/usr/local/bin/code"

brew install --cask flycut
brew install --cask rectangle

brew install watch

brew install zsh zsh-completions
# MAYBE:
echo "$(which zsh)" | sudo tee -a /etc/shells
chsh -s $(which zsh)

brew install golang
export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
mkdir -p "${GOPATH}"
mkdir -p "${GOPATH}/src/github.com"
go install github.com/justjanne/powerline-go@latest

brew install yarn

brew install git
brew install hub

brew tap git-duet/tap
brew install git-duet

brew tap heroku/brew
brew install heroku
heroku autocomplete --refresh-cache

brew install rbenv
brew upgrade rbenv ruby-build
rbenv init

brew install telnet
# brew install --cask multipass
brew install redis

brew install pstree

brew install cmake
brew install --cask chromedriver
brew install lnav
brew install postgresql@16
brew services start postgresql@16
brew install memcached
brew services start memcached
brew install openvpn
brew install --cask ngrok
brew install shellcheck
brew install nginx
brew services start nginx
brew install md5sha1sum

brew install --cask docker  # docker compose too
brew install jq

# you could check if a more recent version exists here:
# https://github.com/nvm-sh/nvm/tags
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

brew install openjdk

# bun (JS)
brew install oven-sh/bun/bun

brew install supabase/tap/supabase

# java
brew install java
brew install maven
