require("mini.deps").setup({ path = { package = path_package } })
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

later(function()
    add({
        source = 'hrsh7th/nvim-cmp',
        depends = {'hrsh7th/cmp-nvim-lsp','hrsh7th/cmp-buffer','L3MON4D3/LuaSnip','saadparwaiz1/cmp_luasnip'}
    })
    vim.cmd [[highlight CmpBorderHighlight guifg = #43464e]]
    vim.cmd [[highlight CmpBackgroundColor guifg = #352D39]]
    vim.cmd [[highlight CmpSearchColor guifg = #80D39B]]
    vim.cmd [[highlight CmpTest guifg = #ffffff]]
    require("luasnip.loaders.from_snipmate").lazy_load({paths = "~/.config/nvim/snippets"})
    local cmp = require("cmp")
    local luasnip = require("luasnip")
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
            { name = "luasnip"},
        },
    })
end)

-- LSP 
later(function()
    add({ source = "neovim/nvim-lspconfig" })
    local signs = {
        Error = "E",
        Warning = "W",
        Hint = "H",
        Information = "I"
    }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    local _border = "single"
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, {
        border = _border
    }
    )
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help, {
        border = _border
    }
    )

    vim.diagnostic.config {
        float = { border = "rounded"}
    }

    local on_attach = function(client)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
        -- vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
        vim.keymap.set('n', '<leader>zz', vim.lsp.buf.format, {})
        vim.keymap.set('n', '<leader>j', vim.diagnostic.goto_next, {})
        vim.keymap.set('n', '<leader>k', vim.diagnostic.goto_prev, {})
    end
    
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local lspconfig = require('lspconfig')
    lspconfig.gopls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })

    lspconfig.rust_analyzer.setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })

    lspconfig.templ.setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })

    lspconfig.svelte.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "svelte" , "html"},
        cmd = { "svelteserver", "--stdio" }
    })
end)
