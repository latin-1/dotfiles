if [[ $- == *i* ]] && [[ $- != *c* ]] && command -v fish &>/dev/null; then
  SHELL=fish exec fish
fi
