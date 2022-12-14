path=(
  "$HOME/.local/bin"
  "$path[@]"
)
export PATH

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

export EDITOR="nvim"
export VISUAL="nvim"

export NODE_OPTIONS="--max-old-space-size=4096"

# https://github.com/microsoft/vscode-eslint/pull/1475
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
