--upower -i $(upower -e | grep BAT) | grep --color=never -E "state|to\ full|to\ empty|percentage"
local awful = require("awful")
local wibox = require("wibox")
local naughty = require('naughty') 
local VARS = require("GetGlobalVars")

local bat = "BAT0"

local function createBatteryWidget(bg_colour)

    local textbox = wibox.widget.textbox("?")
    textbox.font = VARS.font
    local widget = wibox.widget.imagebox(VARS.icons_dir .. "widgetsIcons/battery/battery-fully-charged.svg")

    local box = wibox.widget {
        layout = wibox.layout.fixed.horizontal,
        widget,
        textbox,
		font = VARS.font
    }
 
    awful.widget.watch("cat /sys/class/power_supply/" .. bat .. "/capacity", 60, function (_, stdout)
        textbox.text = stdout .. "%"
    end, textbox)

    awful.widget.watch("cat /sys/class/power_supply/" .. bat .. "/status", 60, function (_, stdout)
        if stdout:match("Discharging") then
            widget:set_image(VARS.icons_dir .. "widgetsIcons/battery/battery-alert-red.svg")
        else
            widget:set_image(VARS.icons_dir .. "widgetsIcons/battery/battery-fully-charged.svg")
        end
    end, widget)

    local margin = wibox.container.margin(box, VARS.margin, VARS.margin, VARS.margin, VARS.margin)
    return wibox.container.background(margin, bg_colour)

end

return createBatteryWidget
