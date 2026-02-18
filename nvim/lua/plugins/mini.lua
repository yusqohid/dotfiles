return {

    -- {
    --     'nvim-mini/mini.nvim',
    --     version = false,
    --     config = function()
    --         require('mini.statusline').setup()
    --         require('mini.pairs').setup()
    --     end
    -- },

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true,
        opts = {}
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    }

}
