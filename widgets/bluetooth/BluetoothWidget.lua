local awful = require("awful")
local wibox = require("wibox")
local os = require("os")
local gears = require("gears")
local VARS = require("GetGlobalVars")
local watch = awful.widget.watch

local bluetoothWidgetCreator = function(bg_colour)

    local widget = wibox.widget.imagebox(VARS.icons_dir .. "widgetsIcons/bluetooth/bluetooth-off.svg")

    widget:buttons(
		gears.table.join(
			awful.button({ }, 1, function() awful.spawn(VARS.bluetoothManager) end)
		)
    )

    watch("bluetooth", 5, function(_, stdout) 
        if stdout:match("bluetooth = off") then
            widget:set_image(VARS.icons_dir .. "widgetsIcons/bluetooth/bluetooth-off.svg")
        else
		    widget:set_image(VARS.icons_dir .. "widgetsIcons/bluetooth/bluetooth.svg")
        end
    end, widget)

    local margin = wibox.container.margin(widget, VARS.margin, VARS.margin, VARS.margin, VARS.margin)
    return wibox.container.background(margin, bg_colour)

end

return bluetoothWidgetCreator
