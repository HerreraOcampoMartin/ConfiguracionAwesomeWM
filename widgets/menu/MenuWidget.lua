local wibox = require("wibox")
local gears = require("gears")
local awful = require("awful")
local VARS = require("GetGlobalVars")
local FUNCS = require("GetFunctions")

local menuWidgetCreator = function(bg_colour)

    local widget = wibox.widget.imagebox(VARS.icons_dir .. "icons/menu.svg")
	
	widget:buttons(
		gears.table.join(
			awful.button({ }, 1, FUNCS.launchMenu)
		)	
	)

	return wibox.container.margin(widget, VARS.margin, VARS.margin)
end

return menuWidgetCreator
