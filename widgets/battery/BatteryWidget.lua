--upower -i $(upower -e | grep BAT) | grep --color=never -E "state|to\ full|to\ empty|percentage"
local awful = require("awful")
local wibox = require("wibox")
local VARS = require("GetGlobalVars")
local bat = "BAT0"

BatteryWidget = {}

function BatteryWidget:new(bg_colour, inst)
	inst = inst or {}
	setmetatable(inst, self)
	self.__index = self

	self.bg_colour = bg_colour

	self:create_widget()

	return inst
end

function BatteryWidget:create_widget()
	local textbox = wibox.widget.textbox("?")
    textbox.font = VARS.smallFont
	local percentage = wibox.widget.textbox("%")
    percentage.font = VARS.smallFont
    local img = wibox.widget.imagebox(VARS.icons_dir .. "widgetsIcons/battery/battery-fully-charged.svg")

    self.widget = wibox.widget {
        layout = wibox.layout.fixed.horizontal,
        img,
        textbox,
		percentage
    }

    awful.widget.watch("cat /sys/class/power_supply/" .. bat .. "/capacity", 5, function (_, stdout)
        textbox.markup = stdout
    end, textbox)

    awful.widget.watch("cat /sys/class/power_supply/" .. bat .. "/status", 5, function (_, stdout)
        if stdout:match("Discharging") then
            img:set_image(VARS.icons_dir .. "widgetsIcons/battery/battery-alert-red.svg")
        else
            img:set_image(VARS.icons_dir .. "widgetsIcons/battery/battery-fully-charged.svg")
        end
    end, img)
end

function BatteryWidget:return_widget()
	local margin = Margin:new(self.widget, VARS.margin, self.bg_colour)
	return margin:return_widget()
end
