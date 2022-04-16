local wibox = require("wibox")
local gears = require("gears")
local awful = require("awful")
local VARS = require("GetGlobalVars")

local tasklistWidgetCreator = function(s)

	local tasklist_buttons = gears.table.join(
		awful.button({ }, 1, function (c)
			    if c == client.focus then
					c.minimized = true
				else
			        c:emit_signal(
			            "request::activate",
				        "tasklist",
						{raise = true}
					)
				end
			end
		),
		awful.button({ }, 3, function()
				awful.menu.client_list({ theme = { width = 250 } })
			end
		)
	)

    local widget = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons,
		style = {
		    font = VARS.font,
			bg_focus = VARS.primaryColour,
			shape  = gears.shape.rectangle,
		},
		layout   = {
	        spacing = 5,
			layout  = wibox.layout.flex.horizontal
	    },
    }

    return wibox.container.margin(widget, VARS.margin, VARS.margin, 0, 0)

end

return tasklistWidgetCreator
