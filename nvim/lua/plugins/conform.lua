return
{
    "stevearc/conform.nvim",
    event = { "BufNewFile", "BufReadPre" },
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                python = { "ruff" },
                typescript = { "prettier" },
                javascript = { "prettier" },
                typescriptreact = { "prettier" },
                javascriptreact = { "prettier" },
                html = { "prettier" },
                css = { "prettier" },
                vue = { "prettier" },
                json = { "prettier" },
                blade = { "blade-formatter" },
                kdl = { "kdlfmt" }
            },
            format_on_save = {
                timeout_ms = 3000,
                format_after_save = true,
                lsp_fallback = true,
            },
        })
    end,
}
