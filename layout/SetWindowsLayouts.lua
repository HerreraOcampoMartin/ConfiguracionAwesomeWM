local awful = require("awful")

local layoutsList = {
    awful.layout.suit.max,
    awful.layout.suit.tile,
    awful.layout.suit.floating
}

awful.layout.layouts = layoutsList