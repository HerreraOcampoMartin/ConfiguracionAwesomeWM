local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local VARS = require("GetGlobalVars")
require("modules.TitlebarFactory")

client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("button::press", function(c)
    c:emit_signal("request::activate", "mouse_press", {raise = true})
end)

client.connect_signal("property::floating", function(c)
    if c.floating == true then
        c:emit_signal("request::titlebars")
    else
        removeTitlebar(c)
    end
end)

client.connect_signal("focus", function(c) 
	c.border_width = VARS.borderWidth
	c.border_color = VARS.focusedBorder
end)
client.connect_signal("unfocus", function(c) 
	c.border_width = VARS.borderWidth
	c.border_color = VARS.unfocusedBorder
end)
