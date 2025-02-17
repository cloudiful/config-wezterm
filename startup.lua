-- local wezterm = require("wezterm")
local utils = require("utils")
local module = {}
-- local mux = wezterm.mux

function module.apply(config)
	local os_name = utils.os_name()

	-- if on Windows then use powershell
	if os_name == "windows" then
		config.default_prog = { "pwsh.exe" }
	end

	config.default_gui_startup_args = { "connect", "unix" }

	-- startup wezterm in max size
	-- wezterm.on("gui-startup", function(cmd)
	-- 	local tab, pane, window = mux.spawn_window(cmd or {})
	-- 	window:gui_window():maximize()
	-- end)
end

return module
