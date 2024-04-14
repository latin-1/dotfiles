path=(
  "$HOME/.local/bin"
  "$HOME/.proto/shims"
  "$HOME/.proto/bin"
  "$path[@]"
)
export PATH

export EDITOR="nvim"
export VISUAL="nvim"

export LESS="-RF"

export NODE_OPTIONS="--max-old-space-size=4096"

# https://github.com/rofl0r/proxychains-ng/issues/549
export PROXYCHAINS_QUIET_MODE="1"
