local awful = require("awful")
local wibox = require("wibox")
local os = require("os")
local VARS = require("GetGlobalVars")
local watch = awful.widget.watch

local bluetoothWidgetCreator = function()

    local widget = wibox.widget.imagebox(VARS.icons_dir .. "bluetooth/bluetooth-off.svg")

    widget:buttons(
        {awful.button({ }, 1, function() awful.spawn(VARS.bluetoothManager) end)}
    )

    watch("rfkill list bluetooth", 5, function(_, stdout) 
        if stdout:match("Soft blocked: yes") then
            widget:set_image(VARS.icons_dir .. "bluetooth/bluetooth-off.svg")
        else
            widget:set_image(VARS.icons_dir .. "bluetooth/bluetooth.svg")
        end
    end, widget)

    return wibox.container.margin(widget, VARS.margin, VARS.margin, VARS.margin, VARS.margin)

end

return bluetoothWidgetCreator