HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

zstyle ':completion:*' menu select
zstyle ':completion:*' special-dirs true

autoload -Uz compinit && compinit
autoload -Uz bashcompinit && bashcompinit

# Key Bindings

bindkey -v

# Aliases

alias vim='nvim'
