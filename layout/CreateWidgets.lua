local awful = require("awful")
local wibox = require('wibox')
local beautiful = require("beautiful")
local VARS = require("GetGlobalVars")
local dpi = beautiful.xresources.apply_dpi

function createRightWidget(WidgetType, arrow_col, bg_col)
    require("widgets.separator.SeparatorWidget")

    local sep = SeparatorWidget:new(arrow_col, bg_col):return_widget()
    local wid = WidgetType:new(bg_col):return_widget()

    return {sep, wid}
end

function TableConcat(t1,t2)
    for i=1,#t2 do
        t1[#t1+1] = t2[i]
    end
    return t1
end

function widgetFactory(s)

    s.mywibox = awful.wibar({
		position = "top",
		screen = s,
		type = "panel",
		height = dpi(VARS.mainPanelSize),
		bg = VARS.mainPanelColour
	})

	--The margin widget is required by all other widgets, so its called before anything else.
	require("widgets.margin.MarginWidget")

	--Left widgets
	require("widgets.menu.MenuWidget")
	require("widgets.taglist.TaglistWidget")
	require("widgets.tasklist.TasklistWidget")

	local menu = MenuWidget:new():return_widget()
	local taglist = TaglistWidget:new(s):return_widget()
	local tasklist = TasklistWidget:new(s):return_widget()

	-- Right widgets
	require("widgets.bluetooth.BluetoothWidget")
	require("widgets.clock.ClockWidget")
	require("widgets.keyboardLayout.KeyboardLayoutWidget")
	require("widgets.layoutBox.LayoutBoxWidget")
	require("widgets.battery.BatteryWidget")
	require("widgets.systray.SystrayWidget")

	local systray = SystrayWidget:new():return_widget()

    local rightWidgets = {layout = wibox.layout.fixed.horizontal, systray}

	i = 2
    rightWidgets = TableConcat(rightWidgets, createRightWidget(BluetoothWidget, VARS.gradients[i-1], VARS.gradients[i]))

	i = 3
    rightWidgets = TableConcat(rightWidgets, createRightWidget(BatteryWidget, VARS.gradients[i-1], VARS.gradients[i]))

	i = 4
    rightWidgets = TableConcat(rightWidgets, createRightWidget(KeyboardLayoutWidget, VARS.gradients[i-1], VARS.gradients[i]))

	i = 5
    rightWidgets = TableConcat(rightWidgets, createRightWidget(ClockWidget, VARS.gradients[i-1], VARS.gradients[i]))

	i = 6
    rightWidgets = TableConcat(rightWidgets, createRightWidget(LayoutBoxWidget, VARS.gradients[i-1], VARS.gradients[i]))
	

    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
			menu,
			taglist
        },
        
		-- Center widgets
		tasklist,

		-- Right widgets
		rightWidgets

    }

	--Manually free memory
	menu = nil
	taglist = nil
	tasklist = nil
	systray = nil
	collectgarbage()

end

return widgetFactory
