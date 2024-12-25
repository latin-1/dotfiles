typeset -U PATH path
path+=(~/.local/bin)
if [[ -f /run/.toolboxenv ]]; then
  path+=(~/.local/bin/toolbox)
fi

if [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
  source <(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi

export EDITOR='nvim'
export VISUAL='nvim'
