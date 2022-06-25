local wibox = require("wibox")
local VARS = require("GetGlobalVars")

Margin = {}

function Margin:new(content, margin, bg_colour, inst)
	inst = inst or {}
	setmetatable(inst, self)
	self.__index = self

	self.content = content
	self.margin = margin
	self.bg_colour = bg_colour

	self:create_widget()

	return inst
end

function Margin:create_widget()
    local inside = wibox.container.margin(self.content, self.margin, self.margin, self.margin, self.margin)

	self.widget = wibox.container.background(inside, self.bg_colour)
end

function Margin:return_widget()
	return self.widget
end
