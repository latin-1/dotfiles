path=(
  "$HOME/.local/bin"
  "$HOME/.cargo/bin"
  "$HOME/Projects/flutter/bin"
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

export VK_ICD_FILENAMES="/usr/share/vulkan/icd.d/radeon_icd.i686.json:/usr/share/vulkan/icd.d/radeon_icd.x86_64.json"

export WINEFSYNC="1"
export WINEDLLOVERRIDES="winemenubuilder.exe=d"
export DXVK_LOG_PATH="none"
