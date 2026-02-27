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
- ``git clone https://github.com/rafalfaro18/.dotfiles.git ~/.dotfiles``
- ``cd ~/.dotfiles``
- ``git submodule init``
- ``git submodule update``
- Install stow
- stow ``name_of_the_app``

## NeoVim & Vim

## Overwrite Session

Run ``:mksession!`` it creates a Session.vim file that Tmux Resurrect automatically applies to vim and neovim restored executions. 

## Start Neovim in specific Session

```sh
# use absolute path for resurrect compatibility
nvim -S ./Session.vim
```

## Tmux

### Save Session

``Prefix Ctrl-s`` . Sessions get saved to ``~/.tmux/resurrect/`` and can be copied and renamed to whatever.txt

### Resurrect Sessions

### Last Session

``Prefix Ctrl-r`` . Defaults to opening session called ``last`` which is a symlink to the latest *.txt file.

#### Selec a session to resurrect

```sh
pkill tmux
tmux new-session -d && FILE=$(/usr/bin/ls ~/.tmux/resurrect/*.txt | fzf) tmux run-shell "~/.tmux/plugins/tmux-resurrect/scripts/restore.sh $FILE" && tmux attach
```
