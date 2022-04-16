local wibox = require("wibox")
local VARS = require("GetGlobalVars")

local systrayWidgetCreator = function(bg_colour)

    local widget = wibox.widget.systray({
		bg_systray = VARS.transparent,
		systray_icon_spacing = 3
	})

--    local margin = wibox.container.margin(widget, VARS.margin, VARS.margin, VARS.margin, VARS.margin)
    return widget

end

return systrayWidgetCreator
