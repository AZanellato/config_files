-- Pull in the wezterm API
local wezterm = require('wezterm')
local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")

local function get_date()
	return fonts.fa_clock_o .. "  " .. wezterm.strftime("%A, %-d %B  %I:%M %p  ")
end

local function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Builtin Solarized Dark'
  else
    return 'Novel'
  end
end

local function tabline_theme(appearance)
  if appearance:find 'Dark' then
    return 'iceberg-dark'
  else
    return 'iceberg-light'
  end
end

local function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Light'
end

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Font configuration

config.font = wezterm.font { 
  family ='FiraCode Nerd Font',
}

config.font_rules = {
  {
    intensity = 'Bold',
    italic = true,
    font = wezterm.font {
      family = 'Iosevka Nerd Font',
      weight = 'Bold',
      style = 'Italic',
      stretch = 'Expanded'
    },
  },
  {
    italic = true,
    intensity = 'Half',
    font = wezterm.font {
      family = 'Iosevka Nerd Font',
      weight = 'DemiBold',
      style = 'Italic',
      stretch = 'Expanded'
    },
  },
  {
    italic = true,
    intensity = 'Normal',
    font = wezterm.font {
      family = 'Iosevka Nerd Font',
      style = 'Italic',
      stretch = 'Expanded'
    },
  },
}

config.font_size = 16.0
config.line_height = 1.0
config.harfbuzz_features = {"cv02", "ss05", "ss07", "ss09"}
-- These features alter these (in order):
-- g
-- @
-- !~ and =~
-- >>= <<= ||= |=

-- tab configuration
config.enable_tab_bar = true
config.tab_bar_at_bottom = true
config.window_background_opacity = 0.99
config.use_fancy_tab_bar = false
config.window_padding = {
  left = 10,
  right = 10,
  top = 0,
  bottom = 0,
}

local color = get_appearance()
tabline.setup({
  options = {
    fmt = string.lower,
    icons_enabled = true,
    theme = tabline_theme(color),
    tabs_enabled = true,
    section_separators = '',
    component_separators = '',
    tab_separators = {
      left = wezterm.nerdfonts.pl_left_soft_divider,
      right = wezterm.nerdfonts.pl_right_soft_divider,
    },
  },
  sections = {
    tabline_a = { 
      {
        'mode',
        fmt = function(mode, window)
          if window:leader_is_active() then
            return wezterm.nerdfonts.oct_rocket
          elseif mode == "NORMAL" then
            return "N " .. wezterm.nerdfonts.cod_terminal
          elseif mode == "COPY" then
            return "C " .. wezterm.nerdfonts.md_scissors_cutting
          elseif mode == "SEARCH" then
            return "S " .. wezterm.nerdfonts.oct_search
          end

			return mode
        end,
      }
    },
    tabline_b = { "workspace" },
    tabline_c = { ' ' },
    tab_active = {
      'index',
      { 'parent', padding = 0 },
      '/',
      { 'cwd', padding = { left = 0, right = 1 } },
      { 'zoomed', padding = 0 },
    },
    tab_inactive = { 'index', { 'process', padding = { left = 0, right = 1 } } },
    tabline_x = { 'ram', 'cpu' },
    tabline_y = { 'datetime', 'battery' },
    tabline_z = { 'domain' },
  },
  extensions = { 'smart_workspace_switcher' },
})

tabline.apply_to_config(config)

config.color_scheme = scheme_for_appearance(color)
local act = wezterm.action
config.leader = { key = 'a', mods = 'OPT', timeout_milliseconds = 1000 }
config.keys = {
  {
    key = "=",
    mods = "LEADER",
    action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = "-",
    mods = "LEADER",
    action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = "z",
    mods = "LEADER",
    action = act.TogglePaneZoomState,
  },
  {
    key = "h",
    mods = "CTRL",
    action = act.ActivatePaneDirection "Left",
  },
  {
    key = "j",
    mods = "CTRL",
    action = act.ActivatePaneDirection "Down",
  },
  {
    key = "k",
    mods = "CTRL",
    action = act.ActivatePaneDirection "Up",
  },
  {
    key = "l",
    mods = "CTRL",
    action = act.ActivatePaneDirection "Right",
  },
  {
    key = 'H',
    mods = 'LEADER',
    action = act.AdjustPaneSize { 'Left', 5 },
  },
  {
    key = 'J',
    mods = 'LEADER',
    action = act.AdjustPaneSize { 'Down', 5 },
  },
  {
    key = 'K',
    mods = 'LEADER',
    action = act.AdjustPaneSize { 'Up', 5 },
  },
  {
    key = 'L',
    mods = 'LEADER',
    action = act.AdjustPaneSize { 'Right', 5 },
  },
  {
    key = '[',
    mods = 'ALT',
    action = act.ActivateTabRelative(-1) 
  },
  {
    key = ']',
    mods = 'ALT',
    action = act.ActivateTabRelative(1) 
  },
  {
    key = '[',
    mods = 'CMD',
    action = act.MoveTabRelative(-1) 
  },
  {
    key = ']',
    mods = 'CMD',
    action = act.MoveTabRelative(1) 
  },
  {
    key = 'c',
    mods = 'LEADER',
    action = act.SpawnTab 'CurrentPaneDomain',
  },
  {
    key = 'n',
    mods = 'LEADER',
    action = act.SwitchToWorkspace
  },
  {
    key = ')',
    mods = 'LEADER',
    action = act.SwitchWorkspaceRelative(1),
  },
  {
    key = '(',
    mods = 'LEADER',
    action = act.SwitchWorkspaceRelative(-1),
  },
  {
    key = "s",
    mods = "LEADER",
    action = workspace_switcher.switch_workspace(),
  },
  {
    key = "S",
    mods = "LEADER",
    action = workspace_switcher.switch_to_prev_workspace(),
  },
  {
    key = ",",
    mods = "LEADER",
    action = act.PromptInputLine {
      description = 'New tab name',
      initial_value = '',
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          window:active_tab():set_title(line)
        end
      end),
    },
  },
  {
    key = 'x',
    mods = 'LEADER',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  {
    key = "r",
    mods = "LEADER",
    action = act.PromptInputLine {
      description = 'Enter for workspace',
      initial_value = wezterm.mux.get_active_workspace(),
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          wezterm.mux.rename_workspace(wezterm.mux.get_active_workspace(), line)
        end
      end),
    },
  },
}

return config
