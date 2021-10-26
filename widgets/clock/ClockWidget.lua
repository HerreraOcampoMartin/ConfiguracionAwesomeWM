local wibox = require("wibox")
local VARS = require("GetGlobalVars")

local clockWidgetCreator = function(bg_colour)

    local widget = wibox.widget.textclock()

    local margin = wibox.container.margin(widget, VARS.margin, VARS.margin, VARS.margin, VARS.margin)
    return wibox.container.background(margin, bg_colour)

end

return clockWidgetCreator
