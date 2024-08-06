local font = "JetBrainsMono Nerd Font Mono 14"

local function setup_workspaces(s)
    awful.tag({ "I", "II", "III", "IV", "V"}, s, awful.layout.layouts[1]) -- selects from the layouts you have

    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        widget_template = {
            {
                {
                    {
                        id     = 'text_role',
                        widget = wibox.widget.textbox,
                    },
                    left  = 10,
                    right = 10,
                    widget  = wibox.container.margin,
                },
                id     = 'background_role',
                widget = wibox.container.background,
            },
            id     = 'margin_role',
            top    = 5,
            bottom = 5,
            widget = wibox.container.margin,
            create_callback = function(self, c3, index, objects) 
                self:get_children_by_id('text_role')[1].font = font -- Set the font here
            end,
            update_callback = function(self, c3, index, objects)
                self:get_children_by_id('text_role')[1].font = font -- Set the font here
            end,
        },
    }
end

return setup_workspaces

