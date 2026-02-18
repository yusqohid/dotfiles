return
{
    "stevearc/conform.nvim",
    event = { "BufNewFile", "BufReadPre" },
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                python = { "ruff" },
                typescript = { "oxfmt" },
                javascript = { "oxfmt" },
                typescriptreact = { "oxfmt" },
                javascriptreact = { "oxfmt" },
                html = { "oxfmt" },
                css = { "oxfmt" },
                vue = { "oxfmt" },
                json = { "oxfmt" },
                blade = { "blade-formatter" },
                -- kdl = { "kdlfmt" }
            },
            format_on_save = {
                timeout_ms = 3000,
                format_after_save = true,
                lsp_fallback = true,
            },
        })
    end,
}
