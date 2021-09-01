local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")
local VARS = require("GetGlobalVars")

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
    awful.button({ }, 1, function(t) t:view_only() end),
    awful.button({ VARS.modkey }, 1, function(t)
            if client.focus then
                client.focus:move_to_tag(t)
            end
        end
    ),
    awful.button({ }, 3, awful.tag.viewtoggle),
    awful.button({ VARS.modkey }, 3, function(t)
            if client.focus then
                client.focus:toggle_tag(t)
            end
        end
    )
)

local tasklist_buttons = gears.table.join(awful.button({ }, 1, function (c)
            if c == client.focus then
                c.minimized = true
            else
                c:emit_signal(
                    "request::activate",
                    "tasklist",
                    {raise = true}
                )
            end
        end
    ),
    awful.button({ }, 3, function()
            awful.menu.client_list({ theme = { width = 250 } })
        end
    )
)


function widgetFactory(s)

    -- Each screen has its own tag table.

--    awful.tag({ "WWW", "TERM", "FILE", "DEV", "MED", "MISC", "MISC", "MISC", "MISC" }, s, awful.layout.layouts[1])
    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end)))
    
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        style   = {
            shape = gears.shape.circle,
            bg_focus = "#FF4E07",
	    font = "Ubuntu Mono 10",
            fg_focus = "#000000",
            bg_occupied = "#3d3d3d",
	    shape_border_width = 1,
	    shape_border_color_empty = "#3d3d3d",
        },
--[[      widget_template = {
            {
                {
                    {
                        {
                            {
                                id     = 'index_role',
                                widget = wibox.widget.textbox,
                            },
                            margins = 4,
                            widget  = wibox.container.margin,
                        },
                        bg     = '#5800E9',
                        shape  = gears.shape.circle,
                        widget = wibox.container.background,
                    },
                    {
                        {
                            id     = 'icon_role',
                            widget = wibox.widget.imagebox,
                        },
                        margins = 2,
                        widget  = wibox.container.margin,
                    },
                    {
                        id     = 'text_role',
                        widget = wibox.widget.textbox,
                    },
                    layout = wibox.layout.fixed.horizontal,
                },
                left  = 5,
                right = 10,
                widget = wibox.container.margin
            },
            id     = 'background_role',
            widget = wibox.container.background,
            -- Add support for hover colors and an index label
            create_callback = function(self, c3, index, objects) --luacheck: no unused args
                self:get_children_by_id('index_role')[1].markup = '<b> '..index..' </b>'
                self:connect_signal('mouse::enter', function()
                    if self.bg ~= '#FDB843' then
                        self.backup     = self.bg
                        self.has_backup = true
                        self.fg = "#000000"
                    end
                    self.bg = '#FDB843'
                    self.fg = "#000000"
                end)
                self:connect_signal('mouse::leave', function()
                    if self.has_backup then 
                        self.bg = self.backup 
                        self.fg = "#ffffff"
                    end
                end)
            end,
            update_callback = function(self, c3, index, objects) --luacheck: no unused args
                self:get_children_by_id('index_role')[1].markup = '<b> '..index..' </b>'
		end,
        }, ]]--
        buttons = taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons,
	style = {
	    font = "Ubuntu Mono 12"
	}
    }

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,

        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist
        },

        s.mytasklist, -- Middle widget

        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            require("widgets.volume.VolumeWidget")(),
            wibox.widget.systray(),
            --require("widgets.wifi.WifiWidget")(),
            --require("widgets.bluetooth.BluetoothWidget")(),
            require("widgets.battery.BatteryWidget")(),
	    require("widgets.keyboardLayout.KeyboardLayoutWidget")(),
            wibox.widget.textclock(),
            s.mylayoutbox,
        },
    }
end

return widgetFactory
