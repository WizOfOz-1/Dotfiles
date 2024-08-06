client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = gears.table.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )

    -- Define margins
    local margin_size = 5

    -- Create margin-wrapped widgets
    local floating_button = wibox.widget {
        awful.titlebar.widget.floatingbutton(c),
        margins = margin_size,
        widget = wibox.container.margin
    }

    local close_button = wibox.widget {
        awful.titlebar.widget.closebutton(c),
        margins = margin_size,
        widget = wibox.container.margin
    }

    awful.titlebar(c, {size=30, position="left"}) : setup {
        { -- Left
            layout  = wibox.layout.fixed.vertical,
            close_button,
            floating_button
        },
        layout = wibox.layout.align.vertical
    }
end)


