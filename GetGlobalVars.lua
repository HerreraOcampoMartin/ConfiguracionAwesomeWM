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
VARS.primaryColour = "#6b00b3" -- VIOLETA --"#d32912" -- ROJO -- "#457DF7" -- AZUL -- "#b8ba25" -- VERDE
VARS.gradients = {"alpha", "#201D2D", "#282536", "#353144", "#3A364A", "#433F54", "#4B475D", "#565369", "#605C74", "#6E6A83"}
VARS.secondaryColour = VARS.gradients[9]
VARS.focusedBorder = VARS.primaryColour

--SIZES
VARS.titlebarSize = 20
VARS.margin = 5
VARS.smallMargin = 3
VARS.mainPanelSize = 22
VARS.gap = 0
VARS.systrayIconsSpacing = 5
VARS.systrayIconsSize = VARS.mainPanelSize - 2

--STYLES
--VARS.mainPanelColour = "#424450" -- Gray
-- VARS.mainPanelColour = "#000000BF"
VARS.mainPanelColour = "#272727" --gruvbox
VARS.transparent = "#00000000"
-- VARS.primaryFont = "#ffffff"
VARS.primaryFont = "#ebdbb2"
VARS.secondaryFont = "#ebdbb2"
VARS.fontName = "FiraCode Nerd Font Mono "
VARS.smallFont = VARS.fontName .. "10"
VARS.font = VARS.fontName .. "10"
VARS.biggerFont = VARS.fontName .. "16"
VARS.giantFont = VARS.fontName .. "38"
VARS.unfocusedBorder = VARS.transparent
VARS.borderWidth = 0
VARS.separatorType = "Diagonal"
VARS.inactiveFont = "#434450"

return VARS
