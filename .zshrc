# History

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt INC_APPEND_HISTORY

# Completion

zstyle ":completion:*" menu select
zstyle ":completion:*" special-dirs true

# Plugins

source <(sheldon source)

autoload -Uz compinit && compinit
autoload -Uz bashcompinit && bashcompinit

eval "$(starship init zsh)"

# Key bindings

bindkey -e

bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

# Aliases

source /usr/share/doc/pkgfile/command-not-found.zsh

alias ls="ls --human-readable --color=auto"
alias jless="jless --mode=line"
alias unar="unar -forks skip"
