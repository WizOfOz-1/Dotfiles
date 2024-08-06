return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    lazy = false,
    config = function()
        local builtin = require('telescope.builtin')
        local telescope = require('telescope')
        local actions = require ('telescope.actions')
        -- Set up Telescope
        telescope.setup {
            defaults = {
                file_ignore_patterns = { 
                    "node_modules" 
                },
                layout_strategy = 'horizontal', 
                layout_config = {
                    horizontal = {
                        width = 0.9, 
                        height = 0.8,
                    },
                    prompt_position = 'top', 
                },
                mappings = {
                    i = {
                        ["<C-e>"] = { "<esc>", type = "command" },
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-c>"] = actions.close,
                    },
                },
            },
        }

        -- Define your key mappings
        local opts = { noremap = true, silent = true }
        vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<CR>', opts)
        vim.api.nvim_set_keymap('n', '<leader>fc', '<cmd>Telescope live_grep<CR>', opts)
        vim.api.nvim_set_keymap('n', '<leader>Fc', '<cmd>Telescope current_buffer_fuzzy_find<CR>', opts)
    end,
}



