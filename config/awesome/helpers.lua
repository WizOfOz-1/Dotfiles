-- helpers.lua
local awful = require("awful")

-- Toggle visibility of the wibar
local function toggle_wibar_visibility()
    local s = awful.screen.focused()
    if s and s.mywibox then
        s.mywibox.visible = not s.mywibox.visible
    end
end

return {
    toggle_wibar_visibility = toggle_wibar_visibility,
}

