local function create_layoutbox(s)
    local layoutbox = awful.widget.layoutbox(s)
    local padded_layoutbox = wibox.container.margin(layoutbox, 10, 10, 10, 10)
    return padded_layoutbox
end
return create_layoutbox

