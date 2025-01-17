-- Pull in the wezterm API
local wezterm = require("wezterm")
local startup = require("startup")
local keymaps = require("keymaps")
local style = require("style")
local servers = require("servers")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

startup.apply(config)
keymaps.apply(config)
style.apply(config)
servers.apply(config)

-- and finally, return the configuration to wezterm
return config
