return
{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
    config = function()
        require("nvim-treesitter.configs").setup({
            modules = {},
            sync_install = false,
            ignore_install = {},
            auto_install = true,
            ensure_installed = {
                "lua",
                "c",
                "python",
                "php",
                "typescript",
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { "blade" },
            },
            indent = {
                enable = true
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<CR>",         -- Start selection
                    node_incremental = "<CR>",       -- Expand to parent node
                    scope_incremental = "<Tab>",     -- Expand to a larger scope
                    node_decremental = "<BS>",       -- Shrink selection
                }
            }
        })
    end,
}
