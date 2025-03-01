if test -x /home/linuxbrew/.linuxbrew/bin/brew
    /home/linuxbrew/.linuxbrew/bin/brew shellenv | source
end

fish_add_path --global ~/.proto/bin
fish_add_path --global ~/.proto/shims
fish_add_path --global ~/.proto/tools/node/globals/bin

try_source ~/.cargo/env.fish

fish_add_path --global ~/.local/bin
if test -e /run/.toolboxenv
    fish_add_path --global ~/.local/bin/toolbox
else
    fish_add_path --global ~/.local/bin/host
end

if command --query nvim
    set --global --export EDITOR nvim
    set --global --export VISUAL nvim
else if command --query vim
    set --global --export EDITOR vim
    set --global --export VISUAL vim
end

set --local less_version (less --version | string match --regex --groups-only 'less (\d+)')
if test "$less_version" -ge 608
    set --global --export BAT_PAGER 'less --RAW-CONTROL-CHARS --quit-if-one-screen --redraw-on-quit'
    set --global --export DELTA_PAGER 'less --RAW-CONTROL-CHARS --quit-if-one-screen --redraw-on-quit'
end

if status is-interactive
    set --global fish_greeting
    fish_config theme choose 'Catppuccin Latte'

    function fish_hybrid_key_bindings
        for mode in default insert visual
            fish_default_key_bindings --mode $mode
        end
        fish_vi_key_bindings --no-erase
    end
    set --global fish_key_bindings fish_hybrid_key_bindings

    starship init fish | source
    enable_transience

    command --query fzf && fzf --fish | source
    command --query zoxide && zoxide init fish | source

    set --global --export FZF_DEFAULT_OPTS '--prompt=\'❯ \' --style=full --no-color'

    command --query nvim && alias vim nvim
    command --query eza && alias tree 'eza --tree'
    command --query unar && alias unar 'unar -forks skip'

    abbr --add x x-spawn

    function x-upgrade
        set --function fish_trace 1
        sudo dnf upgrade
        brew upgrade
        nvim --headless '+Lazy! sync' '+quitall'
        rustup update
        cargo install-update --all
    end
end
