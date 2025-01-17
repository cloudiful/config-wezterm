local wezterm = require("wezterm")
local utils = require("utils")

-- This is the module table that we will export
local module = {}

function module.apply(config)
    local os_name = utils.os_name()

    -- if on Windows uee ALT+wasd to switch pane
    -- if on Mac or Linux use CTRL+wasd to switch pane
    local clipboard_key_mods = ""
    if os_name == "windows" then
        clipboard_key_mods = "CTRL"
    elseif os_name == "macos" then
        clipboard_key_mods = "CMD"
    else
        clipboard_key_mods = "CTRL"
    end

    config.keys = {
        -- if in fullscreen terminal app
        -- then pass through clipboard_key_mods+c as CTRL+c
        -- which can be used in neovim to map keys
        {
            key = "c",
            mods = clipboard_key_mods,
            action = wezterm.action_callback(function(window, pane)
                if pane:is_alt_screen_active() then
                    window:perform_action(wezterm.action.SendKey({ key = "c", mods = "CTRL" }), pane)
                else
                    local has_selection = window:get_selection_text_for_pane(pane) ~= ""
                    if has_selection then
                        window:perform_action(wezterm.action.ClearSelection, pane)
                    else
                        window:perform_action(wezterm.action.SendKey({ key = "c", mods = clipboard_key_mods }), pane)
                    end
                end
            end),
        },

        -- use clipboard_key_mods+v to paste from clipboard
        {
            key = "v",
            mods = clipboard_key_mods,
            action = wezterm.action_callback(function(window, pane)
                window:perform_action(wezterm.action.PasteFrom("Clipboard"), pane)
            end),
        },

        -- use clipboard_key_mods+s to save
        {
            key = "s",
            mods = clipboard_key_mods,
            action = wezterm.action_callback(function(window, pane)
                if pane:is_alt_screen_active() then
                    window:perform_action(wezterm.action.SendKey({ key = "s", mods = "CTRL" }), pane)
                else
                end
            end),
        },

        -- use clipboard_key_mods+z to undo
        {
            key = "z",
            mods = clipboard_key_mods,
            action = wezterm.action_callback(function(window, pane)
                if pane:is_alt_screen_active() then
                    window:perform_action(wezterm.action.SendKey({ key = "z", mods = "CTRL" }), pane)
                end
            end),
        },

        {
            key = "Backspace",
            mods = clipboard_key_mods,
            action = wezterm.action_callback(function(window, pane)
                if pane:is_alt_screen_active() then
                    window:perform_action(wezterm.action.SendKey({ key = "Backspace", mods = "CTRL" }), pane)
                else
                    window:perform_action(wezterm.action.SendKey({ key = "w", mods = "CTRL" }), pane)
                end
            end),
        },

        -- new pane
        {
            key = "|",
            mods = clipboard_key_mods .. "|SHIFT",
            action = wezterm.action_callback(function(window, pane)
                local new_pane = pane:split({ direction = "Right" })
            end),
        },
        {
            key = "_",
            mods = clipboard_key_mods .. "|SHIFT",
            action = wezterm.action_callback(function(window, pane)
                local new_pane = pane:split({ direction = "Bottom" })
            end),
        },

        -- use clipboard_key_mods+w to close pane
        {
            key = "w",
            mods = clipboard_key_mods,
            action = wezterm.action.CloseCurrentPane({ confirm = false }),
        },
    }
end

-- return our module table
return module
