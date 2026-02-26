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

## NeoVim & Vim

## Overwrite Session

Run ``:mksession!`` it creates a Session.vim file that Tmux Resurrect automatically applies to vim and neovim restored executions. 

## Tmux

### Save Session

``Prefix Prefix-s`` . Sessions get saved to ``~/.tmux/resurrect/`` and can be copied and renamed to whatever.txt

### Resurrect Sessions

### Last Session

``Prefix Prefix-r``

#### Selec a session to resurrect

```sh
pkill tmux
tmux new-session -d && FILE=$(/usr/bin/ls ~/.tmux/resurrect/*.txt | fzf) tmux run-shell "~/.tmux/plugins/tmux-resurrect/scripts/restore.sh $FILE" && tmux attach
```
