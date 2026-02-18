return {
    {
        'stevearc/oil.nvim',
        opts = {
            view_options = {
                show_hidden = true,
            },
            delete_to_trash = true,
            float = {
                padding = 4,
                max_width = 0.8,
                max_height = 0,
            },
        },
        dependencies = { "nvim-tree/nvim-web-devicons" },
        lazy = false,
    },

    -- {
    --     'echasnovski/mini.files',
    --     dependencies = { "nvim-tree/nvim-web-devicons" },
    --     version = false,
    --     opts = {},
    --     keys = {
    --         {
    --             "<leader>e",
    --             function()
    --                 local mf = require('mini.files')
    --                 -- Jika buffer punya file, buka di folder file itu. Jika tidak, buka di root.
    --                 if not mf.close() then mf.open(vim.api.nvim_buf_get_name(0), true) end
    --             end,
    --             desc = "Toggle Mini Files"
    --         },
    --     },
    -- },
}
