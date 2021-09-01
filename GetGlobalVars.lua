local VARS = {}

--APPS
VARS.browser = "firefox"
VARS.terminal = "alacritty"
VARS.file_manager = "dolphin"
VARS.editor = "codium"
VARS.bluetoothManager = "blueman-manager"
VARS.networkManager = "xterm -e nmtui" 

--CONTROLS
VARS.modkey = "Mod4"

--SIZES
VARS.titlebarSize = 32
VARS.margin = 2

--DIRS
VARS.icons_dir = os.getenv("HOME") .. "/.config/awesome/res/widgetsIcons/"




return VARS
