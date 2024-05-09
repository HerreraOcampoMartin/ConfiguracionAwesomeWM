local wibox = require("wibox")
local beautiful = require("beautiful")
local VARS = require("GetGlobalVars")

SystrayWidget = {}

function SystrayWidget:new(inst)
	inst = inst or {}
	setmetatable(inst, self)
	self.__index = self

	self:create_widget()

	return inst
end

function SystrayWidget:create_widget()
    self.widget = wibox.widget.systray({
		systray_icon_spacing = VARS.systrayIconsSpacing
	})
    self.widget:set_base_size(VARS.systrayIconsSize)
end

function SystrayWidget:return_widget()
	local margin = Margin:new(self.widget, VARS.smallMargin)
	return margin:return_widget()
end
