local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local os = require("os")
local VARS = require("GetGlobalVars")

local keyboardLayoutWidgetCreator = function()

    local languages = {"es", "us"} 
    local widget = wibox.widget.textbox(languages[1])
    widget.font = "Ubuntu Mono 10"
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

    return wibox.container.margin(widget, VARS.margin, VARS.margin, VARS.margin, VARS.margin)

end

return keyboardLayoutWidgetCreator
