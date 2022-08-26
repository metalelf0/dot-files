local wezterm = require 'wezterm'

return {
  color_scheme = "Gruvbox",
  keys = {
    {
      key = "Enter",
      mods = "CTRL|SHIFT",
      action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
      key = "k",
      mods = "CMD",
      action = wezterm.action.ClearScrollback 'ScrollbackAndViewport',
    }
  }
}
