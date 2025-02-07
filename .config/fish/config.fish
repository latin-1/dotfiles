if test -x /home/linuxbrew/.linuxbrew/bin/brew
    /home/linuxbrew/.linuxbrew/bin/brew shellenv | source
end

fish_add_path ~/.proto/bin
fish_add_path ~/.proto/shims
fish_add_path ~/.proto/tools/node/globals/bin

try_source ~/.cargo/env.fish

fish_add_path ~/.local/bin
if test -e /run/.toolboxenv
    fish_add_path ~/.local/bin/toolbox
else
    fish_add_path ~/.local/bin/host
end

if command -q nvim
    set -gx EDITOR nvim
    set -gx VISUAL nvim
else if command -q vim
    set -gx EDITOR vim
    set -gx VISUAL vim
end

if status is-interactive
    set -g fish_greeting
    fish_config theme choose "Catppuccin Latte"

    function fish_user_key_bindings
        for mode in insert default visual
            fish_default_key_bindings --mode $mode
        end
        fish_vi_key_bindings --no-erase
    end

    starship init fish | source

    command -q fzf && fzf --fish | source
    command -q zoxide && zoxide init fish | source

    set -gx FZF_DEFAULT_OPTS_FILE ~/.config/fzf/config

    command -q nvim && alias vim nvim
    command -q eza && alias tree 'eza --tree'
    command -q unar && alias unar 'unar -forks skip'
end
