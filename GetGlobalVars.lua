local VARS = {}

--APPS
VARS.browser = "firefox"
VARS.terminal = "kitty"
VARS.file_manager = "thunar"
VARS.editor = "neovide"
VARS.bluetoothManager = "blueman-manager"
VARS.networkManager = "kitty -e nmtui"
VARS.menu = "rofi -show drun -show-icons"
VARS.screenshot = "flameshot gui"

--CONTROLS
VARS.modkey = "Mod4"

--VARS
VARS.languages = {"es", "us"}

--DIRS
VARS.icons_dir = os.getenv("HOME") .. "/.config/awesome/res/"

--COLOURS
VARS.gradients = {"alpha", "#8601F2", "#8A17AC", "#8B228A", "#AF2E74", "#C3346A", "#DE5048", "#EC5F35", "#F0A230", "#F0D430"}
VARS.primaryColour = VARS.gradients[3]
VARS.secondaryColour = VARS.gradients[6]
VARS.focusedBorder = VARS.secondaryColour

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
VARS.fontSize = 10
VARS.smallFont = VARS.fontName .. VARS.fontSize
VARS.font = VARS.fontName .. VARS.fontSize
VARS.biggerFont = VARS.fontName .. "14"
VARS.giantFont = VARS.fontName .. "38"
VARS.unfocusedBorder = VARS.transparent
VARS.borderWidth = 0
VARS.separatorType = "Diagonal"
VARS.inactiveFont = "#434450"

return VARS
