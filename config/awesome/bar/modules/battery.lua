local gears = require("gears")
local wibox = require("wibox")
local naughty = require("naughty")

-- Create the battery widget with margins
local battery_widget = wibox.widget {
    {
        {
            max_value     = 100,
            value         = 50, -- Initial value, will be updated
            forced_height = 20,
            forced_width  = 100,
            shape         = gears.shape.rounded_bar,
            bar_shape     = gears.shape.rounded_bar,
            border_color  = "#000000",
            border_width  = 2,
            color         = "#00ff00",
            background_color = "#404040",
            widget        = wibox.widget.progressbar,
            id            = 'battery_bar',
        },
        left = 10,
        right = 10,
        top = 11,
        bottom = 11,
        widget = wibox.container.margin,
    },
    layout = wibox.layout.stack,
}

-- Create a tooltip
local battery_tooltip = wibox.widget {
    text = "",
    widget = wibox.widget.textbox
}

-- Function to update battery and uptime widget
local function update_battery_widget()
    -- Get battery info
    local f = io.popen("acpi -b")
    local battery_info = f:read("*a")
    f:close()
    
    local percentage = battery_info:match("(%d?%d?%d)%%")
    
    if percentage then
        local value = tonumber(percentage)
        battery_widget:get_children_by_id('battery_bar')[1]:set_value(value)
        battery_tooltip.text = "Battery: " .. percentage .. "%"  -- Update tooltip text
        
        if value > 20 then
            battery_widget:get_children_by_id('battery_bar')[1]:set_color("#00ff00")
        else
            battery_widget:get_children_by_id('battery_bar')[1]:set_color("#ff0000")
        end
    else
        battery_widget:get_children_by_id('battery_bar')[1]:set_value(0)
        battery_tooltip.text = "Battery: N/A"  -- Update tooltip text
    end

    -- Get uptime info
    local uptime_f = io.popen("uptime -p")
    local uptime_info = uptime_f:read("*a")
    uptime_f:close()

    -- Remove trailing newline character
    uptime_info = uptime_info:gsub("\n", "")
    
    -- Update tooltip with uptime
    battery_tooltip.text = "Battery: " .. percentage .. "%, Uptime: " .. uptime_info
end

-- Update battery widget every 30 seconds
gears.timer({
    timeout = 30,
    call_now = true,
    autostart = true,
    callback = update_battery_widget,
})

-- Create a container that centers the battery widget vertically
local centered_battery_widget = wibox.container.place(battery_widget, nil, 'center')

-- Attach the tooltip to the battery widget
centered_battery_widget:connect_signal("mouse::enter", function()
    -- Show the tooltip
    naughty.notify({ text = battery_tooltip.text, timeout = 0 })
end)

centered_battery_widget:connect_signal("mouse::leave", function()
    -- Hide the tooltip
    naughty.destroy_all_notifications()
end)

return centered_battery_widget

