if [[ ! -f /run/.toolboxenv ]]; then
  source ~/.config/zsh/default/.zshenv
else
  source ~/.config/zsh/toolbox/.zshenv
fi
