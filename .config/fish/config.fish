fish_add_path --global ~/.proto/bin
fish_add_path --global ~/.proto/shims

if command --query zed
    set --global --export EDITOR 'zed --wait'
    set --global --export VISUAL 'zed --wait'
end

set --local less_version (less --version | string match --regex --groups-only 'less (\d+)')
if test "$less_version" -ge 608
    set --global --export BAT_PAGER 'less --+no-init --RAW-CONTROL-CHARS --quit-if-one-screen --redraw-on-quit'
    set --global --export DELTA_PAGER 'less --+no-init --RAW-CONTROL-CHARS --quit-if-one-screen --redraw-on-quit'
end

if status is-interactive
    set --global fish_greeting
    if contains 'Catppuccin Latte' (fish_config theme list | string split '\n')
        fish_config theme choose 'Catppuccin Latte'
    end

    function fish_hybrid_key_bindings
        for mode in default insert visual
            fish_default_key_bindings --mode $mode
        end
        fish_vi_key_bindings --no-erase
    end
    set --global fish_key_bindings fish_hybrid_key_bindings

    if command --query starship
        starship init fish | source
        enable_transience
    end
end
