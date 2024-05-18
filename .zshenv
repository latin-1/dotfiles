path=(
  "$HOME/.local/bin"
  "$path[@]"
)
export PATH

export EDITOR="nvim"
export VISUAL="nvim"

export LESS="-RF"

# https://github.com/rofl0r/proxychains-ng/issues/549
export PROXYCHAINS_QUIET_MODE="1"
