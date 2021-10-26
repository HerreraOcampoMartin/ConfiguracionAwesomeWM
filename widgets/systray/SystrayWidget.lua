local wibox = require("wibox")
local VARS = require("GetGlobalVars")

local systrayWidgetCreator = function(bg_colour)

    local widget = wibox.widget.systray({
		bg_systray = VARS.transparent
	})

    local margim = wibox.container.margin(widget, VARS.margin, VARS.margin, VARS.margin, VARS.margin)
    return wibox.container.background(margin, bg_colour)

end

return systrayWidgetCreator
