local wibox = require("wibox")
local gears = require("gears")
local awful = require("awful")
local VARS = require("GetGlobalVars")

TasklistWidget = {}

function TasklistWidget:new(s, inst)
	inst = inst or {}
	setmetatable(inst, self)
	self.__index = self

	self:create_widget(s)

	return inst
end

function TasklistWidget:create_widget(s)

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

    self.widget = awful.widget.tasklist {
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


end

function TasklistWidget:return_widget()
    return wibox.container.margin(self.widget, VARS.margin, VARS.margin, 0, 0)
end
