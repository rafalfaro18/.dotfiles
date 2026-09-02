# add this to ~/.config/fish/config.fish
# source ~/.config/fish/personal.fish

fish_vi_key_bindings
# disable bell for mistakes
set -g fish_bell_behavior none

oh-my-posh init fish --config tokyonight_storm | source
