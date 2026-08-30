local wezterm = require 'wezterm'
local config = {}

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
    hsb = { brightness = 0.3 },
  }
}


config.hide_tab_bar_if_only_one_tab = true
--config.window_decorations = "NONE"

-- Fix not opening in Sway in Arch Linux in Pi 5
config.enable_wayland = false

wezterm.on('bell', function(window, pane)
  local title = "Terminal Bell"
  local proc_name = pane:get_foreground_process_name()

  if proc_name then
    -- Cleans up the path to just show the executable name (e.g., 'tmux' or 'git')
    title = "Bell: " .. proc_name:match("([^/\\]+)$")
  end

  -- Trigger system notification
  window:toast_notification(title, pane:get_title(), nil, 4000)
end)

return config
