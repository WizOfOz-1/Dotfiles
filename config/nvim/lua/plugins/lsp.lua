return {
    "neovim/nvim-lspconfig",
    priority = 5000,
    config = function()
        local signs = {
            Error = " ",
            Warning = " ",
            Hint = " ",
            Information = " "
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
            vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', '<leader>zz', vim.lsp.buf.format, {})
            vim.keymap.set('n', '<leader>j', vim.diagnostic.goto_next, {})
            vim.keymap.set('n', '<leader>k', vim.diagnostic.goto_prev, {})
        end
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
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
        lspconfig.tsserver.setup {
            on_attach = on_attach,
            filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "typescript.tsx" },
            cmd = { "typescript-language-server", "--stdio" }
        }



    end,
}
