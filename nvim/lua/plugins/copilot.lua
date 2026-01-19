return
{
    "github/copilot.vim",
    lazy = true,
    cmd = "Copilot",
    config = function()
        vim.keymap.set('i', '<C-J>', 'copilot#Accept("<CR>")', { expr = true, silent = true, noremap = true })
        vim.g.copilot_no_tab_map = true
    end
}
