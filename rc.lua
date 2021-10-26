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
awful.screen.connect_for_each_screen(require("layout.CreateWidgets"))

-- SET AWESOME WM THEME
beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
beautiful.useless_gap = VARS.gap


-- Menubar configuration
menubar.utils.terminal = VARS.terminal -- Set the terminal for applications that require it

-- AUTOSTART APPLICATIONS
awful.spawn.with_shell("nitrogen --restore")
awful.spawn.with_shell("lxpolkit")
awful.spawn.with_shell("picom -f --fade-delta=2")
--awful.spawn.with_shell("picom -f --fade-delta=2 --shadow --shadow-opacity=0.9")
