# History

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt INC_APPEND_HISTORY

# Completion

autoload -Uz compinit && compinit
autoload -Uz bashcompinit && bashcompinit

zstyle ":completion:*" menu select
zstyle ":completion:*" special-dirs true

# Plugins

source <(antibody init)

antibody bundle mafredri/zsh-async
antibody bundle sindresorhus/pure

antibody bundle zsh-users/zsh-completions
antibody bundle zsh-users/zsh-syntax-highlighting
antibody bundle zsh-users/zsh-autosuggestions
antibody bundle zsh-users/zsh-history-substring-search

# Key bindings

bindkey -e

bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

# Aliases

source /usr/share/doc/pkgfile/command-not-found.zsh

alias ls="ls --human-readable --color=auto"
