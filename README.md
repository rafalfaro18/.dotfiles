# My .Dotfiles

## Notes

- I use this setting for keyboard repeat delay and repeat rate (it really makes a difference when navigating with hjkl like in Neovim/Neo-tree):
```sh
# I set this in a number of diferent ways, in CachyOS I use the OS GUI Settings instead
xset r rate 250 40
```
- If on Wayland (i.e CachyOS with KDE Plasma) install wl-clipboard for clipboard syncing between OS, tmux, and NeoVim:
```sh
sudo pacman -S wl-clipboard
```
- If on termux install nerd font by renaming the .otf or .ttf file to ~/.termux/font.ttf (it must be .ttf) and then run ``termux-reload-settings
``
- My i3 config comes from CachyOS KDE Plasma and then I followed the [CachyOS wiki](https://wiki.cachyos.org/configuration/desktop_environments/switch_desktop/) to install i3wm.
- My Sway config comes from I had raspbian installed in Raspberry Pi 5 with desktop environment running wayland and I followed [this guide](https://docs.beescreens.ch/tutorials/install-and-configure-a-raspberry-pi/chapter-6-install-and-configure-sway/) to install Sway. 

## Requirements

### Windows

- Coreutils: ``winget install Microsoft.Coreutils``
- Powershell 7: ``winget install --id Microsoft.PowerShell``

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

## Sway

## Raspberry Pi

- I have to open obs like this:
```sh
MESA_GL_VERSION_OVERRIDE=3.3 obs
```

### Streaming Safely

- Dedicated Streaming Workspace:
```sh
# if on a 1 monitor setup: create a sway virtual display, select it in obs
swaymsg create_output
# if on a 2 monitor setup simply dedicare one screen for streaming and use Workspace 9 or 10. Skip the rest.
# send only the content to be streamed publically to that screen
# mod+shift+number1-0
# check info like resolution of the hidden screen
swaymsg -t get_outputs
# in obs disable preview, right click enable preview projector - windowed
# for less latency than the preview, cursor is usable in preview projector
# it lets me control the hidden window no problem, not tested with games
# or remote desktop like rustdesk / moonlight
# mod+workspace1-0 use the ws number displayed in the hidden screen to go to it
# while controlling that workspace you can simply change it with mod+0
# workspace 10 is my ? basically a wildcard I can use it for privacy
# or I have dedicated workspace 9 clearly labeled for private things

# I can use OBS Preview Projector to control WS9 from some other WS even if I screen share with some other software that isn't OBS

# unplug the hidden monitor with
swaymsg output HEADLESS-1 unplug
```

- Optionally Combine with sway scratchpad: Basically set up apps in scratchpad in another monitor first and then whenever ready focus streaming Workspace (headless output or 2nd display) and pull up the scratchap. 


### Starting it manually via .profile

```sh
# Start Sway without login manager
if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
  # Define variables BEFORE launching the compositor
  export XDG_CURRENT_DESKTOP=sway:wlroots
  export XDG_SESSION_DESKTOP=sway
  export XDG_SESSION_TYPE=wayland
  export DESKTOP_SESSION=sway
  
  exec sway
fi
```
