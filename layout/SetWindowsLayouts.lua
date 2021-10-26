local awful = require("awful")

local layoutsList = {
    awful.layout.suit.max,
	awful.layout.suit.spiral.dwindle,
    awful.layout.suit.tile,
    awful.layout.suit.tile.bottom,
	awful.layout.suit.corner.nw
}

awful.layout.layouts = layoutsList
