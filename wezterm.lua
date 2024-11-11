local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- colors
config.color_scheme = "Tokyo Night"
config.colors = {
	background = "#141414",
}
config.window_background_opacity = 0.85

-- font
config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 10

-- keymaps
local act = wezterm.action
config.keys = {
	{
		key = "E",
		mods = "CTRL|SHIFT",
		action = act.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, pane, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
}

return config
