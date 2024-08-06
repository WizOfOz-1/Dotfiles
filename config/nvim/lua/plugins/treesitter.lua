return {
    "nvim-treesitter/nvim-treesitter",
    priority = 10000,
    config = function()
        require 'nvim-treesitter.configs'.setup {
            auto_install = false,
            ignore_install = {"c","markdown","markdown_inline","lua","bash", "query"},
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true
            }
        }
    end,
}
