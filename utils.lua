local wezterm = require("wezterm")

local module = {}

function module.os_name()
    local os_name = ""
    if wezterm.target_triple == "x86_64-pc-windows-msvc" then
        os_name = "windows"
    elseif wezterm.target_triple == "aarch64-apple-darwin" then
        os_name = "macos"
    else
        os_name = "linux"
    end
    return os_name
end

return module
