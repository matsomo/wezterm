local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- colors
config.color_scheme = "Tokyo Night"
config.colors = {
	background = "#141414",
}
config.window_background_opacity = 0.85

-- font
config.font = wezterm.font("Comic Mono")
config.font_dirs = { "~/Library/Fonts/" }
config.font_size = 12

-- keymaps
local act = wezterm.action
config.keys = {
	{
		key = "E",
		mods = "CTRL|SHIFT",
		action = act.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	{ key = "j", mods = "ALT", description = "Switch to left tab", action = act.ActivateTabRelative(-1) },
	{ key = "k", mods = "ALT", description = "Switch to right tab", action = act.ActivateTabRelative(1) },
	{ key = "j", mods = "CTRL|ALT", description = "Move current tab to the left", action = act.MoveTabRelative(-1) },
	{ key = "k", mods = "CTRL|ALT", description = "Move current tab to the right", action = act.MoveTabRelative(1) },
}

return config
