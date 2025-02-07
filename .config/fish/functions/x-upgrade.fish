function x-upgrade
    set --function fish_trace 1
    sudo dnf upgrade
    brew upgrade
    nvim --headless '+Lazy! sync' '+quitall'
    rustup update
    cargo install-update --all
end
