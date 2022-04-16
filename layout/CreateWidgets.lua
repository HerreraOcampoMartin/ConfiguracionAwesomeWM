local awful = require("awful")
local wibox = require('wibox')
local beautiful = require("beautiful")
local gears = require("gears")
local VARS = require("GetGlobalVars")
local dpi = beautiful.xresources.apply_dpi
local naughty = require('naughty') 

function widgetFactory(s)

    s.mywibox = awful.wibar({ 
		position = "top", 
		screen = s,
		type = dock,
		height = dpi(VARS.mainPanelSize),
		bg = VARS.mainPanelColour
	})

	local importar = {"bluetooth.BluetoothWidget","battery.BatteryWidget","keyboardLayout.KeyboardLayoutWidget","clock.ClockWidget","layoutBox.LayoutBoxWidget"}
	local objetos = {layout = wibox.layout.fixed.horizontal,require("widgets.systray.SystrayWidget")()}

	local long = 0
	for _ in pairs(importar) do long = long + 1 end

	local j = 0
	for i = 1, long, 1 do
		table.insert(objetos, require("widgets.separator.SeparatorWidget")(VARS.gradientes[i], VARS.gradientes[i+1]))
		table.insert(objetos, require("widgets." .. importar[i])(VARS.gradientes[i+1]))
	end

    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
			require("widgets.menu.MenuWidget")(),
			require("widgets.taglist.TaglistWidget")(s)
        },
        
		require("widgets.tasklist.TasklistWidget")(s),
       
		objetos
--		{ -- Right widgets
--            layout = wibox.layout.fixed.horizontal,
--            require("widgets.volume.VolumeWidget")(),
--			require("widgets.systray.SystrayWidget")(),
--			require("widgets.separator.SeparatorWidget")("alpha", VARS.gradient5),
--			require("widgets.wifi.WifiWidget")(VARS.gradient6),
		

--			require("widgets.separator.SeparatorWidget")("alpha", VARS.gradient5),
--            require("widgets.bluetooth.BluetoothWidget")(VARS.gradient5),
--			require("widgets.separator.SeparatorWidget")(VARS.gradient5, VARS.gradient4),
--            require("widgets.battery.BatteryWidget")(VARS.gradient4),
--			require("widgets.separator.SeparatorWidget")(VARS.gradient4, VARS.gradient3),
--		    require("widgets.keyboardLayout.KeyboardLayoutWidget")(VARS.gradient3),
--			require("widgets.separator.SeparatorWidget")(VARS.gradient3, VARS.gradient2),
--            require("widgets.clock.ClockWidget")(VARS.gradient2),
--			require("widgets.separator.SeparatorWidget")(VARS.gradient2, VARS.gradient1),
--            require("widgets.layoutBox.LayoutBoxWidget")(VARS.gradient1),
     --   },
    }
end

return widgetFactory
