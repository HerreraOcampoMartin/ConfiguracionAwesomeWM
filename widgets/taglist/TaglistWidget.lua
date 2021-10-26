local wibox = require("wibox")
local gears = require("gears")
local awful = require("awful")
local VARS = require("GetGlobalVars")

local taglistWidgetCreator = function(s)

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

--    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])
   
	awful.tag.add("", {
		icon = VARS.icons_dir .. 'icons/1.svg',	
		layout = awful.layout.suit.max,
		selected = true,
		screen = s
	})
	
	awful.tag.add("", {
		icon = VARS.icons_dir .. 'icons/2.svg',
		layout = awful.layout.suit.max,
		screen = s
	})

	awful.tag.add("", {
		icon = VARS.icons_dir .. 'icons/3.svg',
		layout = awful.layout.suit.max,
		screen = s
	})

	awful.tag.add("", {
		icon = VARS.icons_dir .. 'icons/4.svg',
		layout = awful.layout.suit.max,
		screen = s
	})

	awful.tag.add("", {
		icon = VARS.icons_dir .. 'icons/5.svg',
		layout = awful.layout.suit.max,
		screen = s
	})

	awful.tag.add("", {
		icon = VARS.icons_dir .. 'icons/6.svg',
		layout = awful.layout.suit.max,
		screen = s
	})

	awful.tag.add("", {
		icon = VARS.icons_dir .. 'icons/7.svg',
		layout = awful.layout.suit.max,
		screen = s
	})

	awful.tag.add("", {
		icon = VARS.icons_dir .. 'icons/8.svg',
		layout = awful.layout.suit.max,
		screen = s
	})

	awful.tag.add("", {
		icon = VARS.icons_dir .. 'icons/9.svg',
		layout = awful.layout.suit.max,
		screen = s
	})

    local widget = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        style   = {
            bg_focus = VARS.primaryColour,
			fg_focus = VARS.primaryFont,
		    font = VARS.font,
            bg_occupied = VARS.secondaryColour,
			fg_occupied = VARS.secondaryFont,
			taglist_squares_unsel = VARS.icons_dir .. 'icons/1.svg'
        },
        buttons = taglist_buttons
    }

    return widget

end

return taglistWidgetCreator
