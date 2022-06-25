local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local VARS = require("GetGlobalVars")

LayoutBoxWidget = {}

function LayoutBoxWidget:new(bg_colour, s, inst)
	inst = inst or {}
	setmetatable(inst, self)
	self.__index = self

	self.bg_colour = bg_colour

	self:create_widget(s)

	return inst
end

function LayoutBoxWidget:create_widget(s)
    self.widget = awful.widget.layoutbox(s)
    self.widget:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
						
end

function LayoutBoxWidget:return_widget()
	local margin = Margin:new(self.widget, VARS.margin, self.bg_colour)
	return margin:return_widget()
end

