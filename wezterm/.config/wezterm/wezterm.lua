local wezterm = require 'wezterm'
local config = {}

local dimmer = { brightness = 0.2 }

config.font = wezterm.font 'JetBrainsMonoNL Nerd Font Mono'
config.font_size = 12
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

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- Helper function to check if a configuration field exists in this WezTerm version
local function has_config_option(name)
  if wezterm.config_properties then
    for _, prop in ipairs(wezterm.config_properties) do
      if prop == name then
        return true
      end
    end
  end
  return false
end

-- Apply the bottom alignment alignment fix safely
if has_config_option('window_content_alignment') then
  config.window_content_alignment = {
    vertical = 'Bottom',
    horizontal = 'Left',
  }
end

config.audible_bell = 'Disabled'

config.hide_tab_bar_if_only_one_tab = true
--config.window_decorations = "NONE"

-- Fix not opening in Sway in Arch Linux in Pi 5
--config.enable_wayland = false

return config
