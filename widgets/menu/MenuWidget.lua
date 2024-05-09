local wibox = require("wibox")
local gears = require("gears")
local awful = require("awful")
local VARS = require("GetGlobalVars")
local FUNCS = require("GetFunctions")

MenuWidget = {}

function MenuWidget:new(inst)
	inst = inst or {}
	setmetatable(inst, self)
	self.__index = self

	self:create_widget()

	return inst
end

function MenuWidget:create_widget()
    self.widget = wibox.widget.imagebox(VARS.icons_dir .. "icons/menu.svg")
	
	self.widget:buttons(
		gears.table.join(
			awful.button({ }, 1, FUNCS.launchMenu)
		)	
	)
end

function MenuWidget:return_widget()
	return self.widget
end

