local battery_widget = require("bar.modules.battery")
local setup_workspaces = require("bar.modules.workspaces")
local create_layoutbox = require("bar.modules.layout_box")
local wifi_widget= require("bar.modules.wifi")
awful.screen.connect_for_each_screen(function(s)
    setup_workspaces(s)
    s.mypromptbox = awful.widget.prompt()
    s.mylayoutbox = create_layoutbox(s)

    s.mywibox = awful.wibar({ position = "top", screen = s, height = 40, visible = true })

    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        expand = "none",
        { 
            layout = wibox.layout.fixed.horizontal,
            s.mylayoutbox,
            s.mypromptbox
        },
        {
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
        },
        { 
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
            battery_widget, 
            wifi_widget
        },
    }
end)

