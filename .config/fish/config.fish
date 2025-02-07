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

if status is-interactive
    set --global fish_greeting
    fish_config theme choose "Catppuccin Latte"

    function fish_user_key_bindings
        for mode in insert default visual
            fish_default_key_bindings --mode $mode
        end
        fish_vi_key_bindings --no-erase
    end

    starship init fish | source

    command --query fzf && fzf --fish | source
    command --query zoxide && zoxide init fish | source

    set --global --export FZF_DEFAULT_OPTS_FILE ~/.config/fzf/config

    command --query nvim && alias vim nvim
    command --query eza && alias tree 'eza --tree'
    command --query unar && alias unar 'unar -forks skip'
end
