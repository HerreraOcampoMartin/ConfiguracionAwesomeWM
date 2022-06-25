local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local beautiful = require("beautiful")
local menubar = require("menubar")
local VARS = require("GetGlobalVars")

--ADD THIS DIRECTORY TO THE AVAILABLE MODULES
--package.path = package.path .. ";" .. os.getenv("HOME") .. "/.config/awesome/"

awful.screen.set_auto_dpi_enabled( true )

--IMPORT MODULES TO CONFIGURE
require("configuration.ManageErrors")
require("configuration.Signals")
require("configuration.Rules")
require("controls.RootKeys")
require("controls.RootButtons")
require("layout.SetWindowsLayouts")
require("layout.CreateMenu")
require("modules.PowerManager")
awful.screen.connect_for_each_screen(require("layout.CreateWidgets"))
awful.screen.focused():emit_signal("request::desktop_decoration")

-- SET AWESOME WM THEME
beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
beautiful.useless_gap = VARS.gap
beautiful.bg_systray = VARS.mainPanelColour


-- Menubar configuration
menubar.utils.terminal = VARS.terminal -- Set the terminal for applications that require it

-- AUTOSTART APPLICATIONS
awful.spawn.with_shell("killall volumeicon")
awful.spawn.with_shell("nitrogen --restore")
awful.spawn.with_shell("lxpolkit")
awful.spawn.with_shell("compton --config ~/.config/awesome/compton.conf")
--awful.spawn.with_shell("compton -m 1 -i 0.9 --focus-exclude 'window_type != \"normal\"'")
awful.spawn.with_shell("sh ~/.config/awesome/ExeDir.sh") --Execute all scripts in ./autostart (load settings, user custom software, etc)
--awful.spawn.with_shell("compton -c -o 0.8 -m 1 -i 0.7 --focus-exclude 'name *?= \"rofi\"' --shadow-exclude 'window_type != \"normal\"'")
--awful.spawn.with_shell("picom -f --fade-delta=2 --shadow --shadow-opacity=0.9")

-- As layout box icon is not displayed at startup, this is a temporarily workaround
-- which updates the widget and therefore draws the current layout icon
awful.layout.inc(1)
awful.layout.inc(-1)
