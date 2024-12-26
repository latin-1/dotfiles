typeset -U PATH path
path+=(~/.local/bin)
if [[ -f /run/.toolboxenv ]]; then
  path+=(~/.local/bin/toolbox)
fi

if [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
  source <(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi

function try_source() {
  if [[ -f $1 ]]; then
    source $1
  fi
}

try_source ~/.cargo/env

# https://moonrepo.dev/proto
path+=(
  ~/.proto/shims
  ~/.proto/tools/node/globals/bin
)

if (( $+commands[nvim] )); then
  export EDITOR='nvim'
  export VISUAL='nvim'
elif (( $+commands[vim] )); then
  export EDITOR='vim'
  export VISUAL='vim'
fi
