#!/bin/bash -eu

git clone https://github.com/moisutsu/dotfiles-template "$HOME/dotfiles"

bash "$HOME/dotfiles/link.sh"

exec zsh -l
