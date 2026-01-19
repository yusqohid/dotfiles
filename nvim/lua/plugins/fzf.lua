return
{
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    keys = {
        { '<leader><leader>', "<cmd>FzfLua files<CR>",      desc = "Find Files" },
        { '<leader>fg',       "<cmd>FzfLua live_grep<CR>",  desc = "Live Grep" },
        { '<leader>fb',       "<cmd>FzfLua buffers<CR>",    desc = "Search Buffers" },
        { '<leader>fh',       "<cmd>FzfLua help_tags<CR>",  desc = "Help Tags" },
        { '<leader>fo',       "<cmd>FzfLua oldfiles<CR>",   desc = "Recent Files" },
        { '<leader>fs',       "<cmd>FzfLua grep_cword<CR>", desc = "Grep Word Under Cursor" },
        { '<leader>fc',       "<cmd>FzfLua commands<CR>",   desc = "Commands" },
    },
}
