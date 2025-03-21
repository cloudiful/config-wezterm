local wezterm = require("wezterm")
local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")
local module = {}

function module.apply(config)
    smart_splits.apply_to_config(config, {
        direction_keys = { "LeftArrow", "DownArrow", "UpArrow", "RightArrow" },
        modifiers = {
            move = "CTRL|SHIFT",
            resize = "CTRL|ALT",
        },
        log_level = "info",
    })
end

return module
