local VARS = {}

--APPS
VARS.browser = "firefox"
VARS.terminal = "kitty"
VARS.file_manager = "thunar"
VARS.editor = "neovide"
VARS.bluetoothManager = "blueman-manager"
VARS.networkManager = "kitty -e nmtui" 
VARS.menu = "rofi -show drun"
VARS.screenshot = "spectacle"

--CONTROLS
VARS.modkey = "Mod4"

--SIZES
VARS.titlebarSize = 28
VARS.margin = 5
VARS.mainPanelSize = 26
VARS.gap = 0

--DIRS
VARS.icons_dir = os.getenv("HOME") .. "/.config/awesome/res/"

--COLOURS
VARS.gradientes = {"alpha", "#8601F2", "#8A17AC", "#8B228A", "#AF2E74", "#C3346A", "#DE5048", "#EC5F35", "#F0A230", "#F0D430"}
VARS.primaryColour = VARS.gradientes[3]
VARS.secondaryColour = VARS.gradientes[6]
VARS.focusedBorder = VARS.primaryColour

--STYLES

VARS.mainPanelColour = "#424450"
VARS.transparent = "#00000000"
VARS.primaryFont = "#ffffff"
VARS.secondaryFont = "#ffffff"
VARS.fontName = "Liberation Mono "
VARS.font = VARS.fontName .. "11"
VARS.giantFont = VARS.fontName .. "38"
VARS.unfocusedBorder = VARS.transparent
VARS.borderWidth = 0

return VARS
