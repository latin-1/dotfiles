if [[ $- == *i* ]] && [[ $- != *c* ]] && command -v fish &>/dev/null; then
  exec fish
fi
