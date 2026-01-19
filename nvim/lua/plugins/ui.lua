return
{
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ft = { "typescriptreact", "html", "javascriptreact", "blade", "svelte", "kdl" },
        ---@module "ibl"
        ---@type ibl.config
        opts = {},
        config = function()
            local highlight = {
                "CursorColumn",
                "Whitespace",
            }
            require("ibl").setup {
                indent = { highlight = highlight, char = "" },
                whitespace = {
                    highlight = highlight,
                    remove_blankline_trail = false,
                },
                scope = { enabled = false },
            }
        end
    },

    {
        'norcalli/nvim-colorizer.lua',
        event = "VeryLazy",
        opts = {}
    },

    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" }
    }
}
