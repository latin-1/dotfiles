source <(sheldon source)

source ~/.config/zsh/common/.zshrc

source <(starship init zsh)

# Key Bindings

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Aliases

alias x='host-spawn'
