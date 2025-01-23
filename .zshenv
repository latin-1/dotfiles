typeset -U PATH path

if [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
  source <(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi

if [[ -f ~/.cargo/env ]]; then
  source ~/.cargo/env
fi

path=(
  ~/.proto/shims
  ~/.proto/tools/node/globals/bin
  $path
)

path=(~/.local/bin $path)
if [[ -f /run/.toolboxenv ]]; then
  path=(~/.local/bin/toolbox $path)
else
  path=(~/.local/bin/host $path)
fi

if (( $+commands[nvim] )); then
  export EDITOR='nvim'
  export VISUAL='nvim'
elif (( $+commands[vim] )); then
  export EDITOR='vim'
  export VISUAL='vim'
fi
