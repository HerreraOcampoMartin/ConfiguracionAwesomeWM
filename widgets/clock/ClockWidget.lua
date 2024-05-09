local wibox = require("wibox")
local VARS = require("GetGlobalVars")

ClockWidget = {}
ClockWidget.__index = ClockWidget

function ClockWidget:new(bg_colour, inst)
	inst = inst or {}
	setmetatable(inst, self)

	self.bg_colour = bg_colour

	self:create_widget()

	return inst
end

function ClockWidget:create_widget()
    self.widget = wibox.widget.textclock(" %a %d %B  %H:%M ")
	self.widget.font = VARS.font
end

function ClockWidget:return_widget()
	local margin = Margin:new(self.widget, VARS.margin, self.bg_colour)
	return margin:return_widget()
end

