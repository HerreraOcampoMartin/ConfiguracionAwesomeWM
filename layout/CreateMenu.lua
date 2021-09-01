
local beautiful = require("beautiful")
local awful = require("awful")
local VARS = require("GetGlobalVars")

myawesomemenu = {
    { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
    { "manual", VARS.terminal .. " -e man awesome" },
    { "restart", awesome.restart },
    { "quit", function() awesome.quit() end },
}

local menu_awesome = { "awesome", myawesomemenu, beautiful.awesome_icon }
local menu_terminal = { "open terminal", VARS.terminal }

mymainmenu = awful.menu({
    items = {
        menu_awesome,
        menu_terminal,
    }
})

return mymainmenu