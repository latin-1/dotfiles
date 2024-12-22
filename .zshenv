if [[ -f /run/.toolboxenv ]]; then
  source ~/.config/zsh/toolbox/.zshenv
else
  source ~/.config/zsh/host/.zshenv
fi
