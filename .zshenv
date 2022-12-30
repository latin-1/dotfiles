path=(
  "$HOME/.local/bin"
  "$path[@]"
)
export PATH

export EDITOR="nvim"
export VISUAL="nvim"

export NODE_OPTIONS="--max-old-space-size=4096"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
