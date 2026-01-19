return {

    {
        "mason-org/mason-lspconfig.nvim",
        event = { "BufNewFile", "BufReadPre" },
        opts = {
            ensure_installed = { "lua_ls" },
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
        config = function(_, opts)
            require("mason-lspconfig").setup(opts)

            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                    },
                },
            })
        end,
    },

}
