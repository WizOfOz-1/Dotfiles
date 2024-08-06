local dpi = require("beautiful.xresources").apply_dpi
local themes_path = gears.filesystem.get_configuration_dir() .. "theme/"
local theme = {}

theme.font          = "sans 8"
theme.bg_normal     = "#000000"
theme.bg_focus      = "#000000"
theme.bg_urgent     = "#000000"
theme.bg_minimize   = "#000000"

theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.useless_gap   = dpi(2)
theme.border_width  = dpi(0)
theme.border_normal = "#535d6c"
theme.border_focus  = "#535d6c"
theme.border_marked = "#91231c"

theme.titlebar_close_button_normal = themes_path.."icons/titlebar/close.svg"
theme.titlebar_close_button_focus  = themes_path.."icons/titlebar/close.svg"

theme.titlebar_floating_button_normal_inactive = themes_path.."icons/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = themes_path.."icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path.."icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = themes_path.."icons/titlebar/floating_focus_active.png"

theme.wallpaper = themes_path.."icons/background.jpg"

theme.layout_magnifier = themes_path.."icons/layouts/magnifierw.png"
theme.layout_max = themes_path.."icons/layouts/maxw.png"
theme.layout_tile = themes_path.."icons/layouts/tilew.png"

return theme

