if [[ -f /run/.toolboxenv ]]; then
  source ~/.config/zsh/toolbox/.zshrc
else
  source ~/.config/zsh/host/.zshrc
fi
