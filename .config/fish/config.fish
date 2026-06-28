fish_add_path --global ~/.local/bin

fish_add_path --global ~/.proto/bin
fish_add_path --global ~/.proto/shims

set --global --export BAT_PAGER 'less --+no-init --RAW-CONTROL-CHARS --quit-if-one-screen'
set --global --export DELTA_PAGER 'less --+no-init --RAW-CONTROL-CHARS --quit-if-one-screen'

if command --query zed
    set --global --export EDITOR nvim
    set --global --export VISUAL nvim
end

if status is-interactive
    set --global fish_greeting

    if contains catppuccin-frappe (fish_config theme list | string split '\n')
        fish_config theme choose catppuccin-frappe
    end

    set --global fish_key_bindings fish_hybrid_key_bindings

    if command --query starship
        starship init fish | source
        enable_transience
    end
end
