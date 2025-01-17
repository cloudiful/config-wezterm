local wezterm = require("wezterm")
local utils = require("utils")
local module = {}

function module.apply(config)
    local os_name = utils.os_name()

    -- theme
    config.color_scheme = "Catppuccin Mocha"

    -- font
    -- need to install JetBrainsMono Nerd Font Mono first
    config.font = wezterm.font_with_fallback({
        { family = "JetBrains Mono" },
        { family = "Source Han Sans CN" },
    })

    -- color
    config.colors = {
        background = "black",
    }

    -- tab style
    config.window_decorations = "INTEGRATED_BUTTONS"
    config.use_fancy_tab_bar = false

    -- padding
    config.window_padding = {
        left = 20,
        right = 20,
        top = 20,
        bottom = 0,
    }

    -- add transparent blur to the window
    if os_name == "windows" then
        config.font_size = 12
        -- available on Windows 11 build 22621 and later.
        config.window_background_opacity = 0.9
        config.win32_system_backdrop = "Acrylic"
    elseif os_name == "macos" then
        config.font_size = 15
        local on_battery = false

        -- decide if using battery
        for _, b in ipairs(wezterm.battery_info()) do
            if b.state == "Discharging" then
                on_battery = true
            end
        end

        -- if not on battery then enable blur effect
        if not on_battery then
            config.window_background_opacity = 0.8
            config.macos_window_background_blur = 60
        else
            wezterm.log_info("Using battery, so no transparent blur effect for background.")
        end
    else
        config.font_size = 12
        config.window_background_opacity = 0.9
    end

    return config
end

return module
