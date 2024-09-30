local opts = { noremap = true, silent = true }
vim.keymap.set("n","<leader>pv",'<cmd>lua MiniFiles.open()<CR>')
vim.api.nvim_set_keymap('v', '<Space>y', '"+y', opts)
vim.api.nvim_set_keymap('n', '<Space>y', '"+y', opts)
vim.api.nvim_set_keymap('n', '<leader>n', '<C-^>', opts)
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Pick files<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fc', '<cmd>Pick grep_live<CR>', opts)
