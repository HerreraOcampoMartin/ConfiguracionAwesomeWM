local VARS = {}

--APPS
VARS.browser = "firefox"
VARS.terminal = "kitty"
VARS.file_manager = "thunar"
VARS.editor = "neovide"
VARS.bluetoothManager = "blueman-manager"
VARS.networkManager = "kitty -e nmtui"
VARS.menu = "rofi -show drun"
VARS.screenshot = "flameshot gui"

--CONTROLS
VARS.modkey = "Mod4"

--VARS
VARS.languages = {"es", "us"}

--DIRS
VARS.icons_dir = os.getenv("HOME") .. "/.config/awesome/res/"

--COLOURS
VARS.gradients = {"alpha", "#201D2D", "#282536", "#353144", "#3A364A", "#433F54", "#4B475D", "#565369", "#605C74", "#6E6A83"}
VARS.primaryColour = "#457DF7" -- AZUL -- "#2eb82e" -- VERDE --"#d32912" -- ROJO -- "#6b00b3" -- VIOLETA 
VARS.secondaryColour = VARS.gradients[9]
VARS.focusedBorder = VARS.primaryColour

--SIZES
VARS.titlebarSize = 28
VARS.margin = 5
VARS.smallMargin = 3
VARS.mainPanelSize = 26
VARS.gap = 0

--STYLES
--VARS.mainPanelColour = "#424450" -- Gray
-- VARS.mainPanelColour = "#000000BF"
VARS.mainPanelColour = "#272727" --gruvbox
VARS.transparent = "#00000000"
-- VARS.primaryFont = "#ffffff"
VARS.primaryFont = "#ebdbb2"
VARS.secondaryFont = "#ebdbb2"
VARS.fontName = "Liberation Mono "
VARS.smallFont = VARS.fontName .. "9"
VARS.font = VARS.fontName .. "11"
VARS.giantFont = VARS.fontName .. "38"
VARS.unfocusedBorder = VARS.transparent
VARS.borderWidth = 0
VARS.separatorType = "Diagonal"

return VARS
