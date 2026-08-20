local wezterm = require 'wezterm'
local config = {}

config.font = wezterm.font 'JetBrainsMonoNL Nerd Font Mono'
config.font_size = 13
config.color_scheme = "tokyonight_night"
config.window_background_image = wezterm.home_dir .. '/Pictures/wallhaven-vgyyxl.png'

config.window_background_image_hsb = {
  -- Darken the background image by reducing it to 1/3rd
  brightness = 0.3,

  -- You can adjust the hue by scaling its value.
  -- a multiplier of 1.0 leaves the value unchanged.
  hue = 1.0,

  -- You can adjust the saturation also.
  saturation = 1.0,
}

config.hide_tab_bar_if_only_one_tab = true
--config.window_decorations = "NONE"

-- Fix not opening in Sway in Arch Linux in Pi 5
config.enable_wayland = false

return config
