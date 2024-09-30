-- Add the Neovim configuration directory to package.path
local config_path = vim.fn.stdpath('config') .. '/?.lua'
package.path = package.path .. ';' .. config_path .. ';' 

local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
    vim.cmd('echo "Installing `mini.nvim`" | redraw')
    local clone_cmd = {
        'git', 'clone', '--filter=blob:none',
        'https://github.com/echasnovski/mini.nvim', mini_path
    }
    vim.fn.system(clone_cmd)
    vim.cmd('packadd mini.nvim | helptags ALL')
    vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

require("stuff.settings")
require("stuff.mappings")
require("stuff.minis")
require("stuff.completions")
