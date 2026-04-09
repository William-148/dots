#!/bin/bash

# Install plugins that are in official arch repositories
echo "Install plugins from official arch repositories..."
sudo pacman -S --needed --noconfirm \
	zsh-autosuggestions \
	zsh-syntax-highlighting \
	zsh-history-substring-search \
	zsh-completions

echo ""
echo "All plugins were installed."
echo "Add these lines into your ~/.zshrc if you do not have it yet:"
echo "source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
echo "source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
echo "source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh"
echo ""
echo "To enable zsh-completions add this into your ~/.zshrc if you do not exist:"
echo "fpath+=(/usr/share/zsh/site-functions)"
echo "autoload -U compinit && compinit"
