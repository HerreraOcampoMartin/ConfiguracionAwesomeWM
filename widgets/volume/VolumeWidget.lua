local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local naughty = require("naughty")
local VARS = require("GetGlobalVars")

local function createVolumeWidget()
    local startup_volume = awful.spawn("awk -F\"[][]\" '/dB/ { print $2 }' <(amixer get Master)")

    local volumeSlide = wibox.widget{
        bar_color="#5f5f60",
        bar_height="5",
        handle_color="#ffffff",
        handle_shape=gears.shape.losange,
        forced_width=100,
        minimum=0,
        maximum=100,
        widget = wibox.widget.slider
    }

    volumeSlide:connect_signal("property::value", function() 
        local volume_level = volumeSlide:get_value()
        awful.spawn("amixer set Master " .. volume_level .. "%")
    end)

    return wibox.container.margin(volumeSlide, VARS.margin, VARS.margin, VARS.margin, VARS.margin)
end

return createVolumeWidget
