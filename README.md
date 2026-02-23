# My .Dotfiles

## Notes

- If on Wayland (i.e CachyOS with KDE Plasma) install wl-clipboard for clipboard syncing between OS, tmux, and NeoVim:
```sh
sudo pacman -S wl-clipboard
```
- If on termux install nerd font by renaming the .otf or .ttf file to ~/.termux/font.ttf (it must be .ttf) and then run ``termux-reload-settings
``

## Instructions

- Set these environment variables if not present in Linux, MacOS and Windows devices using this project.
```sh
XDG_CONFIG_HOME=~/.config
XDG_DATA_HOME=~/.local/share
XDG_CACHE_HOME=~/.cache
```
- Install stow
- stow ``name_of_the_app``
