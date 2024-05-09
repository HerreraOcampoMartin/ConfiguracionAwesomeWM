local wibox = require("wibox")
local gears = require("gears")
local VARS = require("GetGlobalVars")
local separators = { width = VARS.mainPanelSize, height = VARS.mainPanelSize}

SeparatorWidget = {}

function SeparatorWidget:new(bg_arrow, bg_colour, inst)
	inst = {}
	setmetatable(inst, self)
	self.__index = self

    if VARS.separatorType == "Powerline" then
	    self:create_powerline_widget(bg_arrow, bg_colour)
    elseif VARS.separatorType == "Diagonal" then
	    self:create_diagonal_widget(bg_arrow, bg_colour)
    else
	    self:create_empty_widget(bg_arrow, bg_colour)
    end

	return inst
end

function SeparatorWidget:create_powerline_widget(col_arrow, col_bg)
	local sep = wibox.widget.base.make_widget()
    sep.col_arrow = col_arrow
    sep.col_bg = col_bg

    sep.fit = function(m, w, h)
        return separators.width, separators.height
    end

    sep.update = function(col_arrow, col_bg)
        sep.col_arrow = col_arrow
        sep.col_bg = col_bg
        sep:emit_signal("widget::redraw_needed")
    end

    sep.draw = function(mycross, wibox, cr, width, height)
		if sep.col_arrow ~= "alpha" then
	        cr:set_source_rgb(gears.color.parse_color(sep.col_arrow))
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

	    if sep.col_bg ~= "alpha" then
		    cr:new_path()
	        cr:move_to(width, 0)
			cr:line_to(0, height/2)
		    cr:line_to(width, height)
	        cr:close_path()

			cr:set_source_rgb(gears.color.parse_color(sep.col_bg))
		    cr:fill()
	    end
	end

	self.widget = sep

end

function SeparatorWidget:create_empty_widget(col_arrow, col_bg)
	local sep = wibox.widget.base.make_widget()
	self.widget = sep

end

function SeparatorWidget:create_diagonal_widget(col_arrow, col_bg)
	local sep = wibox.widget.base.make_widget()
    sep.col_arrow = col_arrow
    sep.col_bg = col_bg

    sep.fit = function(m, w, h)
        return separators.width, separators.height
    end

    sep.update = function(col_arrow, col_bg)
        sep.col_arrow = col_arrow
        sep.col_bg = col_bg
        sep:emit_signal("widget::redraw_needed")
    end

    sep.draw = function(mycross, wibox, cr, width, height)
		if sep.col_arrow ~= "alpha" then
	        cr:set_source_rgb(gears.color.parse_color(sep.col_arrow))
			cr:new_path()
		    cr:move_to(width, 0)
	        cr:line_to(0, height)
			cr:line_to(0, 0)
		    cr:close_path()
	        cr:fill()

	        cr:new_path()
		    cr:move_to(width, height)
			cr:line_to(0, height)
		    cr:line_to(width, height)
	        cr:close_path()
			cr:fill()
		end

	    if sep.col_bg ~= "alpha" then
		    cr:new_path()
	        cr:move_to(width, 0)
			cr:line_to(0, height)
		    cr:line_to(width, height)
	        cr:close_path()

			cr:set_source_rgb(gears.color.parse_color(sep.col_bg))
		    cr:fill()
	    end
	end

	self.widget = sep

end


function SeparatorWidget:return_widget()
	return self.widget
end
