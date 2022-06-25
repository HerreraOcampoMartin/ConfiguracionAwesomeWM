local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local os = require("os")
local VARS = require("GetGlobalVars")

KeyboardLayoutWidget = {}

function KeyboardLayoutWidget:new(bg_colour, inst)
	inst = inst or {}
	setmetatable(inst, self)
	self.__index = self

	self.bg_colour = bg_colour

	self:create_widget()

	return inst
end

function KeyboardLayoutWidget:create_widget()
    self.widget = wibox.widget.textbox(VARS.languages[1])
    self.widget.font = VARS.font
    i = 1
    languages_size = 0
    for _ in pairs(VARS.languages) do languages_size = languages_size + 1 end

    os.execute('setxkbmap ' .. tostring(VARS.languages[1]))

    self.widget:buttons(
        gears.table.join(
            awful.button({ }, 1, function() 
                if i < languages_size then
                    i = i + 1
                else
                    i = 1
                end
                self.widget.text = tostring(VARS.languages[i])
                os.execute('setxkbmap ' .. tostring(VARS.languages[i]))
            end)
        )
    )

end

function KeyboardLayoutWidget:return_widget()
	local margin = Margin:new(self.widget, VARS.margin, self.bg_colour)
	return margin:return_widget()
end
