return {
    "hrsh7th/nvim-cmp",
    
    event = "InsertEnter",
    dependencies = {
        
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-buffer",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp",
        "onsails/lspkind.nvim",
    },
    config = function()
        vim.cmd [[highlight CmpBorderHighlight guifg = #43464e]]
        vim.cmd [[highlight CmpBackgroundColor guifg = #352D39]]
        vim.cmd [[highlight CmpSearchColor guifg = #80D39B]]
        vim.cmd [[highlight CmpTest guifg = #ffffff]]
        require("luasnip.loaders.from_snipmate").lazy_load({paths = "~/.config/nvim/snippets"})
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require("lspkind")
        luasnip.config.set_config({
            region_check_events = 'InsertEnter',
            delete_check_events = 'InsertLeave'
        })
        cmp.setup({
            confirmation = { completeopt = 'menu,menuone,noinsert' },
            preselect = cmp.PreselectMode.Item,
            window = {
                documentation = cmp.config.window.bordered(),
                completion = cmp.config.window.bordered({
                    border = 'single',
                    winhighlight = 'Normal:CmpTest',
                }),

            },
            formatting = {
                format = lspkind.cmp_format({
                    maxwidth = 50, 
                    ellipsis_char = '...', 
                    before = function (entry, vim_item)
                        return vim_item
                    end
                })
            },
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            completion = {
                completeopt = 'menu,menuone,noinsert',
            },
            mapping = {
                ["<C-k>"] = cmp.mapping.select_prev_item(),
                ["<C-j>"] = cmp.mapping.select_next_item(),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<Tab>"] = cmp.mapping(function (fallback)
                    if luasnip.expandable() then 
                        luasnip.expand()
                    elseif cmp.visible() then
                        cmp.confirm({
                            behavior = cmp.ConfirmBehavior.Insert,
                            select = true,
                        })
                    elseif luasnip.locally_jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, {'i', 's'}),
                ['<S-Tab>'] = cmp.mapping(function (fallback)
                    if cmp.visible() then
                        cmp.confirm({
                            behavior = cmp.ConfirmBehavior.Insert,
                            select = true,
                        })
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, {'i', 's'})
            },
            sources = {
                { name = "nvim_lsp", max_item_count = 2},
                { name = "buffer", max_item_count = 4},
                { name = 'nvim_lsp_signature_help' },
                { name = "luasnip"},
            },
        })
    end,
}


