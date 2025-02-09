local wezterm = require("wezterm")
local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")
local module = {}

function module.apply(config)
	-- you can put the rest of your Wezterm config here
	smart_splits.apply_to_config(config, {
		-- the default config is here, if you'd like to use the default keys,
		-- you can omit this configuration table parameter and just use
		-- smart_splits.apply_to_config(config)

		-- directional keys to use in order of: left, down, up, right
		direction_keys = { "LeftArrow", "DownArrow", "UpArrow", "RightArrow" },
		-- modifier keys to combine with direction_keys
		modifiers = {
			move = "CTRL|SHIFT", -- modifier to use for pane movement, e.g. CTRL+h to move left
			resize = "CTRL|ALT", -- modifier to use for pane resize, e.g. META+h to resize to the left
		},
		-- log level to use: info, warn, error
		log_level = "info",
	})
end

return module
