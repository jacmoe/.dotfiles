local wezterm = require 'wezterm'
return {
  hide_tab_bar_if_only_one_tab = true,
  --Acceptable values are SteadyBlock, BlinkingBlock, SteadyUnderline, BlinkingUnderline, SteadyBar, and BlinkingBar.
  default_cursor_style = 'BlinkingBlock',
  cursor_blink_rate = 800,
  scrollback_lines = 3500,
  font_size = 16.0,
  --color_scheme = "Aci (Gogh)",
  --color_scheme = "Aco (Gogh)",
  --color_scheme = "Adventure",
  --color_scheme = "AdventureTime",
  --color_scheme = "_bash (Gogh)",
  --color_scheme = "Bim (Gogh)",
  color_scheme = "shades-of-purple",
  --color_scheme = "Sakura",
  window_background_opacity = 0.74,
}
