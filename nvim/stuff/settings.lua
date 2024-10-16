vim.o.swapfile = false
vim.o.guifont = "JetBrains Mono:h18"
vim.opt.laststatus=3
vim.g.mapleader= " "
vim.o.termguicolors = true
vim.o.smartcase=true
vim.o.ignorecase=true
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
local imap_expr = function(lhs, rhs)
    vim.keymap.set('i', lhs, rhs, { expr = true })
end
imap_expr('<Tab>',   [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
imap_expr('<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])
