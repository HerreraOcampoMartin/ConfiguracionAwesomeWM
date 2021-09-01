local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local VARS = require("GetGlobalVars")

local function createTitlebar(c, titlebarSize)
    if c.floating then
        c.height = c.height - titlebarSize
    end

    local buttons = gears.table.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c, {size= titlebarSize}) : setup {
        { -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        { -- Middle
            { -- Title
                align  = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
            awful.titlebar.widget.closebutton    (c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.minimizebutton(c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end

function removeTitlebar(c)
    c.height = c.height + VARS.titlebarSize 
    createTitlebar(c, 0)
end

client.connect_signal("request::titlebars", function(c)
    createTitlebar(c, VARS.titlebarSize)   
end)
