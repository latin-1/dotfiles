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

wine-init() {
  local -x WINE="${WINE:-wine}"
  local -x WINESERVER="${WINESERVER:-${WINE}server}"
  local -x WINEPREFIX="${WINEPREFIX:-$HOME/.wine}"
  local -x WINEDLLOVERRIDES="winemenubuilder.exe=d"

  "$WINE" wineboot --init
  "$WINESERVER" --wait

  # winetricks isolate_home
  if pushd "$WINEPREFIX/drive_c/users/$USER" > /dev/null; then
    for name in Documents Desktop; do
      if [[ -h ./$name ]]; then
        rm -f ./$name
        mkdir ./$name
      fi
    done
    for name in Downloads Pictures Music Videos Templates; do
      mkdir -p ./Documents/$name
    done
    popd > /dev/null
  fi
  echo disabled > "$WINEPREFIX/.update-timestamp"

  local documents="$(xdg-user-dir DOCUMENTS 2> /dev/null || true)"
  if [[ "$documents" != "" && "$documents" != "$HOME" ]]; then
    for name in Downloads Pictures Music Videos Templates; do
      rmdir "$documents/$name" 2> /dev/null || true
    done
  fi

  "$WINE" regedit /s - << EOF
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\\Software\\Wine\\DllOverrides]
"winemenubuilder.exe"=""
EOF
  "$WINESERVER" --wait
}
