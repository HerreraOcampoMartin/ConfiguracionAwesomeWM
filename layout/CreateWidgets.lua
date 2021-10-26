local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")
local VARS = require("GetGlobalVars")
local dpi = beautiful.xresources.apply_dpi

function widgetFactory(s)

    s.mywibox = awful.wibar({ 
		position = "top", 
		screen = s,
		type = dock,
		height = dpi(VARS.mainPanelSize),
		bg = VARS.mainPanelColour
	})

    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
			require("widgets.menu.MenuWidget")(),
			require("widgets.taglist.TaglistWidget")(s)
        },
        
		require("widgets.tasklist.TasklistWidget")(s),
        
		{ -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            require("widgets.volume.VolumeWidget")(),
			require("widgets.separator.SeparatorWidget")("alpha", VARS.gradient6),
			--require("widgets.systray.SystrayWidget")(),
			require("widgets.wifi.WifiWidget")(VARS.gradient6),
			require("widgets.separator.SeparatorWidget")(VARS.gradient6, VARS.gradient5),
            require("widgets.bluetooth.BluetoothWidget")(VARS.gradient5),
			require("widgets.separator.SeparatorWidget")(VARS.gradient5, VARS.gradient4),
            require("widgets.battery.BatteryWidget")(VARS.gradient4),
			require("widgets.separator.SeparatorWidget")(VARS.gradient4, VARS.gradient3),
		    require("widgets.keyboardLayout.KeyboardLayoutWidget")(VARS.gradient3),
			require("widgets.separator.SeparatorWidget")(VARS.gradient3, VARS.gradient2),
            require("widgets.clock.ClockWidget")(VARS.gradient2),
			require("widgets.separator.SeparatorWidget")(VARS.gradient2, VARS.gradient1),
            require("widgets.layoutBox.LayoutBoxWidget")(VARS.gradient1),
        },
    }
end

return widgetFactory
