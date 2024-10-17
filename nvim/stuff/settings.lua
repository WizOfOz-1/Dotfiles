vim.o.completeopt = 'menuone,noinsert'
vim.notify("Hello, Neovim!")
vim.o.swapfile = false
vim.o.guifont = "JetBrains Mono:h18"
vim.opt.laststatus = 3
vim.g.mapleader = " "
vim.o.termguicolors = true
vim.o.smartcase = true
vim.o.ignorecase = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.wrap = true
vim.wo.signcolumn = 'yes'
vim.wo.cursorline = false
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.linebreak = true
vim.o.undofile = false
vim.opt.list = false
vim.opt.hlsearch = false

-- Map Ctrl+k and Ctrl+j to the up and down arrow keys
vim.keymap.set('i', '<C-j>', '<Down>', { noremap = true })
vim.keymap.set('i', '<C-k>', '<Up>', { noremap = true })

-- Use Tab to confirm selection
vim.keymap.set('i', '<Tab>', [[pumvisible() ? "\<C-y>" : "\<Tab>"]], { expr = true })

-- Uncomment if you want to handle snippets on completion
-- vim.api.nvim_create_autocmd('CompleteDonePre', {
--     callback = function()
--         -- Retrieve the completed item
--         local completed_item = vim.v.completed_item
--
--         -- Check if the completed item has snippet support
--         if completed_item and completed_item.user_data and completed_item.user_data.nvim and completed_item.user_data.nvim.lsp and completed_item.user_data.nvim.lsp.completion_item then
--             local completion_item = completed_item.user_data.nvim.lsp.completion_item
--             if completion_item.insertTextFormat == 2 and completion_item.textEdit then
--                 -- Expand the snippet after inserting the completion
--                 vim.snippet.expand(completion_item.textEdit.newText)
--             end
--         end
--     end
-- })
--
