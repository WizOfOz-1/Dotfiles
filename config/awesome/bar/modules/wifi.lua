local gears = require("gears")
local wibox = require("wibox")

-- Create the Wi-Fi widget with margins
local wifi_widget = wibox.widget {
    {
        image  = gears.filesystem.get_configuration_dir() .. "theme/icons/Wifi-Online.png",
        resize = true,
        widget = wibox.widget.imagebox,
    },
    widget = wibox.container.margin,
    left   = 10,
    right  = 10,
    top    = 6,    -- Adjust as needed
    bottom = 6,    -- Adjust as needed
}

-- Center the widget vertically while maintaining margins
local centered_wifi_widget = wibox.container.place(wifi_widget, nil, 'center')

return centered_wifi_widget

