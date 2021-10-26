local VARS = {}

--APPS
VARS.browser = "firefox"
VARS.terminal = "kitty"
VARS.file_manager = "thunar"
VARS.editor = "mousepad"
VARS.bluetoothManager = "blueman-manager"
VARS.networkManager = "kitty -e nmtui" 
VARS.menu = "rofi -show drun"

--CONTROLS
VARS.modkey = "Mod4"

--SIZES
VARS.titlebarSize = 32
VARS.margin = 5
VARS.mainPanelSize = 32
VARS.gap = 5

--DIRS
VARS.icons_dir = os.getenv("HOME") .. "/.config/awesome/res/"

-- GRADIENT
VARS.gradient1 = "#8601F2"
VARS.gradient2 = "#8A17AC"
VARS.gradient3 = "#8B228A"
VARS.gradient4 = "#AF2E74"
VARS.gradient5 = "#C3346A"
VARS.gradient6 = "#DE5048"
VARS.gradient7 = "#EC5F35"
VARS.gradient8 = "#F0A230"
VARS.gradient9 = "#F0D430"

VARS.primaryColour = VARS.gradient3
VARS.secondaryColour = VARS.gradient6

--STYLES
--VARS.primaryColour = "#0066FF" -- AZUL
--VARS.secondaryColour = "#535D6C" -- GRIS POR DEFECTO
--VARS.secondaryColour = "#8701F2" --VIOLETA
--VARS.secondaryColour = "#D50DB1" --ROSA

VARS.mainPanelColour = "#000000AA"
VARS.transparent = "#00000000"
VARS.primaryFont = "#ffffff"
VARS.secondaryFont = "#ffffff"
VARS.font = "Roboto 9"
VARS.unfocusedBorder = VARS.transparent
VARS.focusedBorder = VARS.secondaryColour
VARS.borderWidth = 3

return VARS
