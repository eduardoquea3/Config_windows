local w = require("wezterm")
local wezterm = require("wezterm")
return {
  color_scheme = "catppuccin-mocha",
  font = w.font("JetBrainsMono Nerd Font", { weight = "Bold" }),
  font_size = 16.00,
  front_end = "OpenGL",
  default_cursor_style = "SteadyBar",
  enable_kitty_graphics = true,
  default_prog = { "C:\\Program Files\\PowerShell\\7\\pwsh.exe", "-l" },
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  default_cwd = "G:\\",
  enable_tab_bar = true,
  -- tab_bar_at_bottom = true,
  -- hide_tab_bar_if_only_one_tab = true,
  use_fancy_tab_bar = false,
  window_decorations = "RESIZE",
  colors = {
    cursor_bg = "#c0caf5",
    cursor_border = "#c0caf5",
    cursor_fg = "#1a1b26",
    selection_bg = "#33467C",
    selection_fg = "#c0caf5",
    -- The color of the split lines between panes
    split = "#444444",
    -- ansi = { "#15161E", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#a9b1d6" },
    -- brights = { "#414868", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#c0caf5" },
    tab_bar = {
      background = "#0c1123",
      new_tab = { bg_color = "#0c1123", fg_color = "#ffffff", intensity = "Bold" },
      new_tab_hover = { bg_color = "#121d58", fg_color = "#ffffff", intensity = "Bold" },
      -- format-tab-title
      active_tab = { bg_color = "#579de6", fg_color = "#231a1a" },
      inactive_tab = { bg_color = "#0c1123", fg_color = "#fce8ac" },
      inactive_tab_hover = { bg_color = "#12103d", fg_color = "#FCE8C3" },
    },
  },
  window_background_opacity = 0.76,
  text_background_opacity = 1.0,
  leader = { key = "o", mods = "CTRL" },
  disable_default_key_bindings = false,
  keys = {
    {
      key = "d",
      mods = "ALT",
      action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
    },
    {
      key = "u",
      mods = "ALT",
      action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
    },
    { key = "c", mods = "LEADER",       action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
    { key = "h", mods = "LEADER",       action = wezterm.action({ ActivatePaneDirection = "Left" }) },
    { key = "j", mods = "LEADER",       action = wezterm.action({ ActivatePaneDirection = "Down" }) },
    { key = "k", mods = "LEADER",       action = wezterm.action({ ActivatePaneDirection = "Up" }) },
    { key = "l", mods = "LEADER",       action = wezterm.action({ ActivatePaneDirection = "Right" }) },
    { key = "H", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Left", 5 } }) },
    { key = "J", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Down", 5 } }) },
    { key = "K", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Up", 5 } }) },
    { key = "L", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Right", 5 } }) },
    { key = "X", mods = "CTRL|SHIFT",   action = wezterm.action({ CloseCurrentTab = { confirm = false } }) },
    { key = "x", mods = "ALT",          action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
    { key = "v", mods = "ALT",          action = wezterm.action.PasteFrom("Clipboard") },
    { key = "c", mods = "ALT",          action = wezterm.action.CopyTo("ClipboardAndPrimarySelection") },
    {
      key = "r",
      mods = "LEADER",
      action = wezterm.action.PromptInputLine({
        description = "Enter new name for tab",
        action = wezterm.action_callback(function(window, _, line)
          -- line will be `nil` if they hit escape without entering anything
          -- An empty string if they just hit enter
          -- Or the actual line of text they wrote
          if line then
            window:active_tab():set_title(line)
          end
        end),
      }),
    },
  },
}
