#!/bin/bash

echo ">> Installing config dots into ~/.config ..."
# Create directories beforehand to prevent Stow from symlinking
# the entire folder, ensuring it links only the folder’s contents
# instead.
mkdir -p ~/.config/nvim
# Create config symlink with stow
# stow -v -t ~/.config config

echo ">> Installing home dots into ~/ ..."
# Create config symlink with stow
stow -v --dotfiles -t ~ home

echo ">> Installing local dots into ~/.local ..."
# Create config symlink with stow
stow -v --dotfiles -t ~ local

echo ">> Done"
