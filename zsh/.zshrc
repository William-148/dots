# PLUGINS
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# Config for zsh-completions
fpath+=/usr/share/zsh/site-functions
autoload -U compinit && compinit

# BINDKEYS
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

# INIT STARSHIP
eval "$(starship init zsh)"

# INIT ZOXIDE
eval "$(zoxide init zsh)"

# ALIAS FOR LSD
alias ls='lsd'

# ALIAS FOR BAT
# alias cat='bat'

# FAST NODE MANAGER (FNM)
FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi

