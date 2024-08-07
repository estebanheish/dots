local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()
local colors_exist, colors = pcall(require, 'colors')

config.hide_tab_bar_if_only_one_tab = true
config.enable_scroll_bar = true
config.font =  wezterm.font 'Ubuntu Mono'
config.font_size = 16
config.color_scheme = 'nord'
config.front_end = "WebGPu"
config.window_close_confirmation = 'NeverPrompt'

config.keys = {
  { key = 'Enter', mods = 'ALT', action = act.DisableDefaultAssignment },
  { key = 't', mods = 'CTRL', action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 'Escape', mods = 'CTRL', action = act.CloseCurrentTab{ confirm = true } },
  -- { key = 'w', mods = 'CTRL', action = act.CloseCurrentTab{ confirm = true } },
  { key = 'E', mods = 'CTRL', action = act.ActivateTabRelative(-1) },
  { key = 'N', mods = 'CTRL', action = act.ActivateTabRelative(1) },
  { key = 'H', mods = 'CTRL', action = act.ActivateTabRelative(-1) },
  { key = 'I', mods = 'CTRL', action = act.ActivateTabRelative(1) },
  { key = 'f', mods = 'CTRL', action = act.Search 'CurrentSelectionOrEmptyString' },
}

if colors_exist then
  config.window_frame = colors.window_frame;
  config.colors = colors.colors;
end

local search_mode = nil
if wezterm.gui then
  search_mode = wezterm.gui.default_key_tables().search_mode
  table.insert(
    search_mode,
    { key = 'N', mods = 'CTRL', action = act.CopyMode 'PriorMatch' }
  )
end

config.key_tables = { search_mode = search_mode }

return config
