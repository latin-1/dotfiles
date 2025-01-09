HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS

zstyle ':completion:*' menu select
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' list-colors $LS_COLORS

(( $+commands[starship] )) && source <(starship init zsh)
(( $+commands[sheldon] )) && source <(sheldon source)

autoload -Uz compinit && compinit
autoload -Uz bashcompinit && bashcompinit

(( $+commands[fzf] )) && source <(fzf --zsh)
(( $+commands[zoxide] )) && source <(zoxide init zsh)

export FZF_DEFAULT_OPTS_FILE=~/.config/fzf/config

# Key bindings

bindkey -v

# Aliases

(( $+commands[nvim] )) && alias vim='nvim'
(( $+commands[eza] )) && alias tree='eza --tree'
(( $+commands[unar] )) && alias unar='unar -forks skip'

if [[ -f /run/.toolboxenv ]]; then
  if (( $+commands[host-spawn] )); then
    alias x='host-spawn'
  elif (( $+commands[flatpak-spawn] )); then
    alias x='flatpak-spawn --host'
  fi
fi

function x-upgrade() {
  set -x
  sudo dnf upgrade
  brew upgrade
  sheldon lock --update
  nvim --headless '+Lazy! sync' '+quitall'
  rustup update
  cargo install-update --all
}

# Shell integration

if [[ -n $GHOSTTY_RESOURCES_DIR ]]; then
  source $GHOSTTY_RESOURCES_DIR/shell-integration/zsh/ghostty-integration
fi
