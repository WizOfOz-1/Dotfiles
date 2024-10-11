require("mini.deps").setup({ path = { package = path_package } })
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- ColorScheme
now(function()
    vim.cmd('colorscheme dino')
end)

-- Basics 
later(function()
    require ("mini.basics").setup({
        options = { basic = true, extra_ui = true, win_borders = "single", },
        mappings = { basics = true, option_toggle_prefix = [[\]], windows = true, move_with_alt = false, },
        autocommands = { basic = true},
        silet = true
    })
end
)
-- Better around, in actions
later(function() require ("mini.ai").setup({ silent = true }) end)
-- Comments
later(function() require ("mini.comment").setup() end)
-- Indent Scope
later(function()
    require ("mini.indentscope").setup({
        draw = {delay = 150, animation = require('mini.indentscope').gen_animation.none()},
        mappings = {goto_top = 'gt', goto_bottom = 'gb',},
        options = {indent_at_cursor = true,},
        symbol = '|',
    })
end)
later(function() require("mini.extra").setup({}) end)
-- Jump
later(function() require("mini.jump2d").setup({ silent=true }) end)
-- Move text
later(function() require("mini.move").setup() end)
-- Pairs
later(function() require("mini.pairs").setup() end)
-- Split Join
later(function() require("mini.splitjoin").setup({mappings = {toggle = 'ms'}}) end)
-- Surround
later(function() require("mini.surround").setup({silent=true}) end)
-- Pick
later(function() require("mini.pick").setup({silent=true, mappings = { move_down = '<C-j>', move_up = '<C-k>', move_start = '<C-g>', }}) end)
-- Files
later(function() require("mini.files").setup({}) end)
