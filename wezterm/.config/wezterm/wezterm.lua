local wezterm = require 'wezterm'
local config = {}

local dimmer = { brightness = 0.9 }

config.font = wezterm.font 'JetBrainsMonoNL Nerd Font Mono'
config.font_size = 13
config.color_scheme = "tokyonight_night"
config.background = {
  {
    source = { File = wezterm.home_dir .. '/Pictures/wallhaven-vgyyxl.png' },
    width = 'Cover',
    height = 'Cover',
    horizontal_align = "Right",
    vertical_align = "Top",
    hsb = dimmer,
  }
}

config.audible_bell = 'Disabled'

config.hide_tab_bar_if_only_one_tab = true
--config.window_decorations = "NONE"

-- Fix not opening in Sway in Arch Linux in Pi 5
--config.enable_wayland = false

return config
