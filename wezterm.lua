-- Pull in the wezterm API
local wezterm = require('wezterm')

-- Plugins
local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
local resurrect = wezterm.plugin.require("https://github.com/MLFlexer/resurrect.wezterm")
-- End Plugins
local act = wezterm.action

local function isViProcess(pane)
  return pane:get_foreground_process_name():find('n?vim') ~= nil or pane:get_title():find("n?vim") ~= nil
end

local function conditionalActivatePane(window, pane, pane_direction, vim_direction)
  if isViProcess(pane) then
    window:perform_action(
      -- This should match the keybinds you set in Neovim.
      act.SendKey({ key = vim_direction, mods = 'CTRL' }),
      pane
      )
  else
    window:perform_action(act.ActivatePaneDirection(pane_direction), pane)
  end
end

wezterm.on('ActivatePaneDirection-right', function(window, pane)
    conditionalActivatePane(window, pane, 'Right', 'l')
end)
wezterm.on('ActivatePaneDirection-left', function(window, pane)
    conditionalActivatePane(window, pane, 'Left', 'h')
end)
wezterm.on('ActivatePaneDirection-up', function(window, pane)
    conditionalActivatePane(window, pane, 'Up', 'k')
end)
wezterm.on('ActivatePaneDirection-down', function(window, pane)
    conditionalActivatePane(window, pane, 'Down', 'j')
end)

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

-- loads the state whenever I create a new workspace
wezterm.on("smart_workspace_switcher.workspace_switcher.created", function(window, _, label)
  local workspace_state = resurrect.workspace_state
  
  workspace_state.restore_workspace(resurrect.state_manager.load_state(label, "workspace"), {
    window = window,
    relative = true,
    restore_text = true,
    on_pane_restore = resurrect.tab_state.default_on_pane_restore,
  })
end)

-- Saves the state whenever I select a workspace
wezterm.on("smart_workspace_switcher.workspace_switcher.selected", function(window, _, label)
  local workspace_state = resurrect.workspace_state
  resurrect.state_manager.save_state(workspace_state.get_workspace_state())
end)

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
config.window_background_opacity = 1
config.use_fancy_tab_bar = false

local color = get_appearance()

tabline.setup({
  options = {
    fmt = string.lower,
    icons_enabled = true,
    theme = tabline_theme(color),
    theme_overrides = {
      tab = {
        active = { fg = '#33374c', bg = '#bfc3c7' },
      }
    },
    tabs_enabled = true,
    section_separators = '',
    component_separators = '',
    tab_separators = {
      right = " ",
      left = wezterm.nerdfonts.ple_right_half_circle_thick,
    },
  },
  sections = {
    tabline_a = {
      {
        'mode',
        fmt = function(mode, window)
          local key_table = window:active_key_table()
          if window:leader_is_active() then
            return wezterm.nerdfonts.oct_rocket
          elseif key_table == "move_pane" then
            return "M " .. wezterm.nerdfonts.cod_layout_panel_justify
          elseif mode == "COPY" then
            return "C " .. wezterm.nerdfonts.md_scissors_cutting
          elseif mode == "SEARCH" then
            return "S " .. wezterm.nerdfonts.oct_search
          elseif mode == "NORMAL" then
            return "N " .. wezterm.nerdfonts.cod_terminal
          end
        end,
      }
    },
    tabline_b = { "workspace" },
    tabline_c = { 'tabs' },
    tabline_x = { 'ram', 'cpu' },
    tabline_y = { 'datetime' },
    tabline_z = { 'battery', wezterm.nerdfonts.cod_coffee, "hostname", "  " },
    tab_active = {
      'index',
      { 'process', padding = { left = 0, right = 1 } },
      '- ',
      { 'cwd', padding = { left = 0, right = 1 } },
      { 'zoomed', padding = { left = 0, right = 1 } },
    },
    tab_inactive = { 'index', { 'tab', padding = { left = 0, right = 1 } } },
  },
  extensions = { 'smart_workspace_switcher' },
})

tabline.apply_to_config(config)

config.color_scheme = scheme_for_appearance(color)
config.leader = { key = 'a', mods = 'OPT', timeout_milliseconds = 1000 }
config.keys = {
  {
    key = "_",
    mods = "LEADER",
    action = act.SplitHorizontal { domain = "CurrentPaneDomain" },
  },
  {
    key = "-",
    mods = "LEADER",
    action = act.SplitVertical { domain = "CurrentPaneDomain" },
  },
  {
    key = "z",
    mods = "LEADER",
    action = act.TogglePaneZoomState,
  },
  {
    key = "h",
    mods = "CTRL",
    action = act.EmitEvent("ActivatePaneDirection-left"),
  },
  {
    key = "j",
    mods = "CTRL",
    action = act.EmitEvent("ActivatePaneDirection-down"),
  },
  {
    key = "k",
    mods = "CTRL",
    action = act.EmitEvent("ActivatePaneDirection-up"),
  },
  {
    key = "l",
    mods = "CTRL",
    action = act.EmitEvent("ActivatePaneDirection-right"),
  },
  {
    key = "h",
    mods = "SUPER",
    action = act.AdjustPaneSize { "Left", 5 },
  },
  {
    key = "j",
    mods = "SUPER",
    action = act.AdjustPaneSize { "Down", 5 },
  },
  {
    key = "k",
    mods = "SUPER",
    action = act.AdjustPaneSize { "Up", 5 },
  },
  {
    key = "l",
    mods = "SUPER",
    action = act.AdjustPaneSize { "Right", 5 },
  },
  {
    key = "[",
    mods = "ALT",
    action = act.ActivateTabRelative(-1)
  },
  {
    key = "]",
    mods = "ALT",
    action = act.ActivateTabRelative(1)
  },
  {
    key = "[",
    mods = "CMD",
    action = act.MoveTabRelative(-1)
  },
  {
    key = "]",
    mods = "CMD",
    action = act.MoveTabRelative(1)
  },
  {
    key = "c",
    mods = "LEADER",
    action = act.SpawnTab "CurrentPaneDomain",
  },
  {
    key = "n",
    mods = "LEADER",
    action = wezterm.action.PromptInputLine({
			description = "Enter name for new workspace",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
          local name = nil
          if line ~= "" then
            name = line
          end
					window:perform_action(wezterm.action.SwitchToWorkspace({ name = name }), pane)
				end
			end),
		}),
  },
  {
    key = ")",
    mods = "LEADER",
    action = act.SwitchWorkspaceRelative(1),
  },
  {
    key = "(",
    mods = "LEADER",
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
    action = wezterm.action_callback(function(_, _)
        resurrect.state_manager.save_state(resurrect.workspace_state.get_workspace_state())
      end),
  },
  {
    key = ",",
    mods = "LEADER",
    action = act.PromptInputLine {
      description = "New tab name",
      initial_value = "",
      action = wezterm.action_callback(function(window, _, line)
        if line then
          window:active_tab():set_title(line)
        end
      end),
    },
  },
  {
    key = "x",
    mods = "LEADER",
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  {
    key = "r",
    mods = "LEADER",
    action = act.PromptInputLine {
      description = "Enter for workspace",
      initial_value = wezterm.mux.get_active_workspace(),
      action = wezterm.action_callback(function(_, _, line)
        if line then
          wezterm.mux.rename_workspace(wezterm.mux.get_active_workspace(), line)
        end
      end),
    },
  },
  {
    key = "b",
    mods = "LEADER",
    action = wezterm.action_callback(function(_, pane)
      local tab, _ = pane:move_to_new_tab()
      tab:activate()
    end),
  },
  {
    key = "!",
    mods = "LEADER",
    action = wezterm.action_callback(function(_, pane)
      local _, window = pane:move_to_new_window()
      window:activate()
    end),
  },
  {
    key = "Enter",
    mods = "LEADER",
    action = act.ActivateCopyMode
  },
  {
    key = "M",
    mods = "LEADER",
    action = act.ActivateKeyTable {
      name = "move_pane",
      one_shot = false,
    },
  },
  {
    key = "r",
    mods = "ALT",
    action = wezterm.action_callback(function(win, pane)
      resurrect.fuzzy_loader.fuzzy_load(win, pane, function(id, _)
        local type = string.match(id, "^([^/]+)") -- match before "/"
        id = string.match(id, "([^/]+)$") -- match after "/"
        id = string.match(id, "(.+)%..+$") -- remove file extention
        local opts = {
          relative = true,
          restore_text = true,
          on_pane_restore = resurrect.tab_state.default_on_pane_restore,
        }
        if type == "workspace" then
          local state = resurrect.state_manager.load_state(id, "workspace")
          resurrect.workspace_state.restore_workspace(state, opts)
        elseif type == "window" then
          local state = resurrect.state_manager.load_state(id, "window")
          resurrect.window_state.restore_window(pane:window(), state, opts)
        elseif type == "tab" then
          local state = resurrect.state_manager.load_state(id, "tab")
          resurrect.tab_state.restore_tab(pane:tab(), state, opts)
        end
      end)
    end),
  },
}

config.key_tables = {
  -- Defines the keys that are active in our move-pane mode.
  -- Since we're likely to want to make multiple adjustments,
  -- we made the activation one_shot=false. We therefore need
  -- to define a key assignment for getting out of this mode.
  -- 'move-pane' here corresponds to the name="resize_pane" in
  -- the key assignments above.
  move_pane = {
    { key = 'LeftArrow', action = act.AdjustPaneSize { 'Left', 1 } },
    { key = 'h', action = act.AdjustPaneSize { 'Left', 1 } },

    { key = 'RightArrow', action = act.AdjustPaneSize { 'Right', 1 } },
    { key = 'l', action = act.AdjustPaneSize { 'Right', 1 } },

    { key = 'UpArrow', action = act.AdjustPaneSize { 'Up', 1 } },
    { key = 'k', action = act.AdjustPaneSize { 'Up', 1 } },

    { key = 'DownArrow', action = act.AdjustPaneSize { 'Down', 1 } },
    { key = 'j', action = act.AdjustPaneSize { 'Down', 1 } },

    -- Cancel the mode by pressing escape
    { key = 'Escape', action = 'PopKeyTable' },
    { key = 'c', mods = "CTRL", action = 'PopKeyTable' },
  },
}
-- override defaults to never skip confirmation
config.skip_close_confirmation_for_processes_named = {}
config.window_padding = {
  left = '0.5cell',
  right = '0.5cell',
  top = '0.5cell',
  bottom = 0,
}
local resurrect_event_listeners = {
  "resurrect.error",
  "resurrect.state_manager.save_state.finished",
}
local is_periodic_save = false
wezterm.on("resurrect.periodic_save", function()
  is_periodic_save = true
end)
for _, event in ipairs(resurrect_event_listeners) do
  wezterm.on(event, function(...)
    if event == "resurrect.state_manager.save_state.finished" and is_periodic_save then
      is_periodic_save = false
      return
    end
    local args = { ... }
    local msg = event
    for _, v in ipairs(args) do
      msg = msg .. " " .. tostring(v)
    end
    wezterm.gui.gui_windows()[1]:toast_notification("Wezterm - resurrect", msg, nil, 4000)
  end)
end


return config
