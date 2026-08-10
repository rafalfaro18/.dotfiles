local wezterm = require 'wezterm'
local config = {}

config.font = wezterm.font 'JetBrainsMonoNL Nerd Font Mono'
config.font_size = 13
config.color_scheme = "Tokyo Night"
config.window_background_image = 'Pictures/wallhaven-vgyyxl.png'

config.window_background_image_hsb = {
  -- Darken the background image by reducing it to 1/3rd
  brightness = 0.3,

  -- You can adjust the hue by scaling its value.
  -- a multiplier of 1.0 leaves the value unchanged.
  hue = 1.0,

  -- You can adjust the saturation also.
  saturation = 1.0,
}

return config
