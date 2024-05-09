local gears = require("gears")
local awful = require("awful")
local VARS = require("GetGlobalVars")

clientKeys = gears.table.join(awful.key({ VARS.modkey,}, "f",
        function (c)
			c.floating = not c.fullscreen
			c.fullscreen = not c.fullscreen
        end,
        {description = "Toggle fullscreen", group = "client"}),

    awful.key({ VARS.modkey, "Shift" }, "w",      function (c) c:kill() end,
              {description = "Close", group = "client"}),
    
    awful.key({ VARS.modkey, "Shift"}, "f",	  
		function (c)
			c.floating = not c.floating
			if(c.fullscreen) then c.fullscreen = not c.fullscreen end
		end
	,
              {description = "Toggle floating", group = "client"}),

    awful.key({ VARS.modkey, "Control"}, "space", function (c) c:swap(awful.client.getmaster()) end,
              {description = "Move to master", group = "client"}),

    awful.key({ VARS.modkey,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "Move to screen", group = "client"}),

    awful.key({ VARS.modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),

    awful.key({ VARS.modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),

    awful.key({ VARS.modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),

    awful.key({ VARS.modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),

    awful.key({ VARS.modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),

    awful.key({ VARS.modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),

    awful.key({ VARS.modkey,           }, "n",
        function (c)
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),

	awful.key({ VARS.modkey, "Shift"}, "Tab",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),

    awful.key({ VARS.modkey,           }, "Tab",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),

    awful.key({ VARS.modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"})

)

return clientKeys
