local awful = require("awful")
local VARS = require("GetGlobalVars")
FUNCS = {}

FUNCS.launchMenu = function () 
	awful.spawn(VARS.menu)
end

return FUNCS
