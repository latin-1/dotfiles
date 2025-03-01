if [[ $- == *i* ]] && [[ $- != *c* ]] && command -v fish &>/dev/null; then
  SHELL="$(command -v fish)" exec fish
fi
