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
vim.cmd('syntax enable')
vim.wo.cursorline = false
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.linebreak = true
vim.api.nvim_exec([[
  autocmd InsertEnter * set nohlsearch
  autocmd InsertEnter * nnoremap <silent> n :nunmap n<CR>:set hlsearch<CR>n
  autocmd BufNewFile,BufRead *.templ set filetype=templ
]], false)
vim.api.nvim_create_autocmd('ModeChanged', {
  pattern = '*',
  callback = function()
    if ((vim.v.event.old_mode == 's' and vim.v.event.new_mode == 'n') or vim.v.event.old_mode == 'i')
        and require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()]
        and not require('luasnip').session.jump_active
    then
      require('luasnip').unlink_current()
    end
  end
})
