require("mini.deps").setup({ path = { package = path_package } })
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

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
        vim.opt.omnifunc = 'v:lua.MiniCompletion.completefunc_lsp'
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
        vim.keymap.set('n', '<leader>zz', vim.lsp.buf.format, {})
        vim.keymap.set('n', '<leader>j', vim.diagnostic.goto_next, {})
        vim.keymap.set('n', '<leader>k', vim.diagnostic.goto_prev, {})
    end
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true -- Optional, if you want snippet support

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

    lspconfig.ts_ls.setup({
        on_attach = on_attach,
        hostInfo = "neovim",
        capabilities = capabilities,
        filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
        cmd = { "typescript-language-server", "--stdio" }
    })

end)

later(
function() 
    require("mini.completion").setup(
    {
        delay = { completion = 100, info = 100, signature = 50 },

        window = {
            info = { height = 25, width = 80, border = 'none' },
            signature = { height = 25, width = 80, border = 'none' },
        },
        lsp_completion = {
            source_func = 'omnifunc',
            auto_setup = false,
        },
        fallback_action = '<C-x><C-n>',
        mappings = {
            force_twostep = '<C-Space>', -- Force two-step completion
            force_fallback = '<A-Space>', -- Force fallback completion
        },
        set_vim_settings = true,
    }

    )
end
)
