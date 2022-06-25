local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local VARS = require("GetGlobalVars")
local watch = awful.widget.watch

BluetoothWidget = {}

function BluetoothWidget:new(bg_colour, inst)
	inst = inst or {}
	setmetatable(inst, self)
	self.__index = self

	self.bg_colour = bg_colour

	self:create_widget()

	return inst
end

function BluetoothWidget:create_widget()
    self.widget = wibox.widget.imagebox(VARS.icons_dir .. "widgetsIcons/bluetooth/bluetooth-off.svg")
	
    self.widget:buttons(
		gears.table.join(
			awful.button({ }, 1, function() awful.spawn(VARS.bluetoothManager) end)
		)
    )

    watch("bluetooth", 5, function(_, stdout) 
        if stdout:match("bluetooth = off") then
            self.widget:set_image(VARS.icons_dir .. "widgetsIcons/bluetooth/bluetooth-off.svg")
        else
		    self.widget:set_image(VARS.icons_dir .. "widgetsIcons/bluetooth/bluetooth.svg")
        end
    end, self.widget)

end

function BluetoothWidget:return_widget()
	local margin = Margin:new(self.widget, VARS.margin, self.bg_colour)
	return margin:return_widget()
end

