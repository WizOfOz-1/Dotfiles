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
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
    pattern = '*.svelte',
    callback = function()
        print("working")
        vim.schedule(function() 
            vim.cmd('setlocal syntax=html')
        end)
    end
})
