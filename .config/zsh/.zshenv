typeset -U PATH path
path+=(~/.local/bin)
if [[ -f /run/.toolboxenv ]]; then
  path+=(~/.local/bin/toolbox)
fi

if [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
  source <(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi

source ~/.cargo/env

# https://moonrepo.dev/proto
path+=(
  ~/.proto/shims
  ~/.proto/tools/node/globals/bin
)

export EDITOR='nvim'
export VISUAL='nvim'
