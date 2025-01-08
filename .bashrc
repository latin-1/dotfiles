# https://github.com/containers/toolbox/issues/908
if [[ -f /run/.toolboxenv ]]; then
  zsh_path="$(command -v zsh)"
  if [[ -n $zsh_path ]]; then
    exec env SHELL="$zsh_path" "$zsh_path"
  fi
fi
