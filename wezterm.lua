-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- and finally, return the configuration to wezterm

config.font = wezterm.font { 
  family ='FiraCode Nerd Font',
}

config.font_rules = {
  {
    intensity = 'Bold',
    italic = true,
    font = wezterm.font {
      family = 'Iosevka Term',
      weight = 'Bold',
      style = 'Italic',
      stretch = 'Expanded'
    },
  },
  {
    italic = true,
    intensity = 'Half',
    font = wezterm.font {
      family = 'Iosevka Term',
      weight = 'DemiBold',
      style = 'Italic',
      stretch = 'Expanded'
    },
  },
  {
    italic = true,
    intensity = 'Normal',
    font = wezterm.font {
      family = 'Iosevka Term',
      style = 'Italic',
      stretch = 'Expanded'
    },
  },
}


config.font_size = 13.0
config.line_height = 1.0
config.harfbuzz_features = {"cv02", "ss05", "ss07", "ss09"}
-- These features alter these (in order):
-- g
-- @
-- !~ and =~
-- >>= <<= ||= |=


-- config.color_scheme = 'Kanagawa (Gogh)'
config.enable_tab_bar = false
config.window_background_opacity = 0.95
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
-- config.window_decorations = "RESIZE"
return config
