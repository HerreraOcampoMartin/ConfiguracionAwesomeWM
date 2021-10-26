local wibox = require("wibox")
local gears = require("gears")
local VARS = require("GetGlobalVars")
local separators = { width = VARS.mainPanelSize / 2, height = VARS.mainPanelSize}

local separatorWidgetCreator = function(col_arrow, col_bg)

	local widget = wibox.widget.base.make_widget()
    widget.col_arrow = col_arrow
    widget.col_bg = col_bg

    widget.fit = function(m, w, h)
        return separators.width, separators.height
    end

    widget.update = function(col_arrow, col_bg)
        widget.col_arrow = col_arrow
        widget.col_bg = col_bg
        widget:emit_signal("widget::redraw_needed")
    end

    widget.draw = function(mycross, wibox, cr, width, height)
		if widget.col_arrow ~= "alpha" then
	        cr:set_source_rgb(gears.color.parse_color(widget.col_arrow))
			cr:new_path()
		    cr:move_to(width, 0)
	        cr:line_to(0, height/2)
			cr:line_to(0, 0)
		    cr:close_path()
	        cr:fill()

	        cr:new_path()
		    cr:move_to(width, height)
			cr:line_to(0, height/2)
		    cr:line_to(0, height)
	        cr:close_path()
			cr:fill()
		end

	    if widget.col_bg ~= "alpha" then
		    cr:new_path()
	        cr:move_to(width, 0)
			cr:line_to(0, height/2)
		    cr:line_to(width, height)
	        cr:close_path()

			cr:set_source_rgb(gears.color.parse_color(widget.col_bg))
		    cr:fill()
	    end
	end

	return widget

end

return separatorWidgetCreator
