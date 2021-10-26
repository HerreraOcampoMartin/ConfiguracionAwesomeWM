local gears = require("gears")
local awful = require("awful")
local VARS = require("GetGlobalVars")

clientKeys = gears.table.join(awful.key({ VARS.modkey,}, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "Toggle fullscreen", group = "client"}),

    awful.key({ VARS.modkey, "Shift" }, "c",      function (c) c:kill() end,
              {description = "Close", group = "client"}),
    
    awful.key({ VARS.modkey, "Shift"}, "f",  awful.client.floating.toggle,
              {description = "Toggle floating", group = "client"}),

    awful.key({ VARS.modkey, "Control"}, "space", function (c) c:swap(awful.client.getmaster()) end,
              {description = "Move to master", group = "client"}),

    awful.key({ VARS.modkey,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "Move to screen", group = "client"}),

	awful.key({ VARS.modkey,			}, "b",		function(c) awful.util.spawn("blueman-manager") end,
			  { description = "Launch bluetooth manager", group="client"}
	),

    awful.key({ VARS.modkey,           }, "n",
        function (c)
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),

	awful.key({				 }, "Print",
		function (c) 
			awful.util.spawn("flameshot gui")
		end,
		{ description = "screenshot", group = "client" }
	),

    awful.key({ VARS.modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"}),

	awful.key({ 			}, "XF86AudioPlay", 
	function(c) 
		awful.util.spawn("playerctl play-pause")
	end,
	{ description="play/pause media", group="client" })

)

return clientKeys
