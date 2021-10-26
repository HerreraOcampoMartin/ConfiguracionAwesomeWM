local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local VARS = require("GetGlobalVars")

local layoutWidgetCreator = function(bg_colour)

    local widget = awful.widget.layoutbox(s)
    widget:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end)))

    local margin = wibox.container.margin(widget, VARS.margin, VARS.margin, VARS.margin, VARS.margin)
    return wibox.container.background(margin, bg_colour)

end

return layoutWidgetCreator
