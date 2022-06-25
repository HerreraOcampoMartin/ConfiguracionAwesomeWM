local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")
local VARS = require("GetGlobalVars")
local FUNCS = require("GetFunctions")

globalkeys = gears.table.join(
    awful.key({ VARS.modkey,           }, "F1",      hotkeys_popup.show_help,
              {description="Show help", group="awesome"}),

    awful.key({ VARS.modkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),

    awful.key({ VARS.modkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),

    awful.key({ VARS.modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),

	awful.key({ VARS.modkey }, "b",		function() awful.util.spawn("blueman-manager") end,
			  { description = "Launch bluetooth manager", group="client"}),

	awful.key({ 			}, "XF86AudioPlay", function(c) awful.spawn("playerctl play-pause") end,
	{ description="play/pause media", group="client" }),

	awful.key({				 }, "Print",
		function (c) 
			awful.util.spawn(VARS.screenshot)
		end,
		{ description = "screenshot", group = "client" }
	),

    -- Layout manipulation
    awful.key({ VARS.modkey, "Shift"   }, "Right", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),

    awful.key({ VARS.modkey, "Shift"   }, "Left", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),

    awful.key({ VARS.modkey, "Control" }, "Right", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),

    awful.key({ VARS.modkey, "Control" }, "Left", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),

    awful.key({ VARS.modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),

    -- Standard program
    awful.key({ VARS.modkey,           }, "Return", function () awful.spawn(VARS.terminal) end,
              {description = "open a terminal", group = "launcher"}),

    awful.key({ VARS.modkey, "Shift" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),

    awful.key({ VARS.modkey, "Shift"   }, "q", function() awesome.emit_signal("module::exit_screen:show") end,
              {description = "quit awesome", group = "awesome"}),

    awful.key({ VARS.modkey, "Shift" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:emit_signal(
                        "request::activate", "key.unminimize", {raise = true}
                    )
                  end
              end,
              {description = "restore minimized", group = "client"}),

    awful.key({ VARS.modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),

    awful.key({ VARS.modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),

    -- Prompt
    awful.key({ VARS.modkey },            "r",     FUNCS.launchMenu,
              {description = "Run Rofi Menu", group = "launcher"})

)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ VARS.modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ VARS.modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ VARS.modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ VARS.modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

root.keys(globalkeys)
