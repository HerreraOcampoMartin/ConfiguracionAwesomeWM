local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local os = require("os")
local VARS = require("GetGlobalVars")

local keyboardLayoutWidgetCreator = function(bg_colour)

    local languages = {"es", "us"} 
    local widget = wibox.widget.textbox(languages[1])
    widget.font = VARS.font
    i = 1
    languages_size = 0
    for _ in pairs(languages) do languages_size = languages_size + 1 end

    os.execute('setxkbmap ' .. tostring(languages[1]))

    widget:buttons(
        gears.table.join(
            awful.button({ }, 1, function() 
                if i < languages_size then
                    i = i + 1
                else
                    i = 1
                end
                widget.text = tostring(languages[i])
                os.execute('setxkbmap ' .. tostring(languages[i]))
            end)
        )
    )

    local margin = wibox.container.margin(widget, VARS.margin, VARS.margin, VARS.margin, VARS.margin)
    return wibox.container.background(margin, bg_colour)

end

return keyboardLayoutWidgetCreator
