--upower -i $(upower -e | grep BAT) | grep --color=never -E "state|to\ full|to\ empty|percentage"
local awful = require("awful")
local wibox = require("wibox")
local naughty = require('naughty') 
local VARS = require("GetGlobalVars")

local bat = "BAT0"

local function createBatteryWidget()

    local textbox = wibox.widget.textbox("?")
    textbox.font = "Ubuntu Mono 10"
    local widget = wibox.widget.imagebox(VARS.icons_dir .. "battery/battery-fully-charged.svg")

    local box = wibox.widget {
        layout = wibox.layout.fixed.horizontal,
        widget,
        textbox
    }
 
    awful.widget.watch("cat /sys/class/power_supply/" .. bat .. "/capacity", 60, function (_, stdout)
        textbox.text = stdout .. "%"
    end, textbox)

    awful.widget.watch("cat /sys/class/power_supply/" .. bat .. "/status", 60, function (_, stdout)
        if stdout:match("Discharging") then
            widget:set_image(VARS.icons_dir .. "battery/battery-alert-red.svg")
        else
            widget:set_image(VARS.icons_dir .. "battery/battery-fully-charged.svg")
        end
    end, widget)

    return wibox.container.margin(box, VARS.margin, VARS.margin, VARS.margin, VARS.margin)

end

return createBatteryWidget
