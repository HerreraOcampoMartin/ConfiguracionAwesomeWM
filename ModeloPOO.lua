Widget = {}

function Widget:new(bg_colour, inst)
	inst = inst or {}
	setmetatable(inst, self)
	self.__index = self

	self.bg_colour = bg_colour

	self:create_widget()

	return inst
end

function Widget:return_widget()
	local margin = Margin:new(self.widget, VARS.margin, self.bg_colour)
	return margin:return_widget()
end
