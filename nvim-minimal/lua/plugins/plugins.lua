vim.pack.add {
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  -- { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
  { src = 'https://github.com/nvim-mini/mini.pairs' },
  { src = 'https://github.com/ibhagwan/fzf-lua' },
  { src = 'https://github.com/nvim-tree/nvim-tree.lua' },
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
  { src = 'https://github.com/lewis6991/gitsigns.nvim' }
}

vim.lsp.enable({ "clangd", "lua_ls", "gopls", "rust_analyzer", "intelephense", "oxfmt" })

local map = vim.keymap.set

---------------------------     NvimTree    ---------------------------
require("nvim-tree").setup()
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "NeoTreeToggle" })

require('mini.pairs').setup()

---------------------------     FzfLua      ---------------------------
require("fzf-lua").setup {
  winopts = {
    treesitter = { enabled = false },
    previewers = {
      builtin = {
        treesitter = { enabled = false }
      }
    }
  },
}
map("n", "<leader><leader>", "<cmd>FzfLua files<CR>", { desc = "Pick Files" })
map("n", "<leader>fb", "<cmd>FzfLua buffers<CR>", { desc = "Pick Buffers" })
map("n", "<leader>fo", "<cmd>FzfLua oldfiles<CR>", { desc = "Pick Oldfiles" })
map("n", "<leader>ft", "<cmd>FzfLua tabs<CR>", { desc = "Pick Tabs" })
map("n", "<leader>fg", "<cmd>FzfLua live_grep<CR>", { desc = "Live Grep" })
