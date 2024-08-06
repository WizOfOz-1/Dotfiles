vim.keymap.set("n","<leader>pv",vim.cmd.Ex)
vim.api.nvim_set_keymap('n', '<Space>y', '"+y', { noremap = true })

vim.api.nvim_set_keymap('v', '<Space>y', '"+y', { noremap = true })
vim.api.nvim_set_keymap('n', '<Tab>', '%', { noremap = true })
vim.api.nvim_set_keymap('v', '<Tab>', '%', { noremap = true })
