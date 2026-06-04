vim.pack.add {
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  -- { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
  { src = 'https://github.com/nvim-mini/mini.pairs' },
  { src = 'https://github.com/ibhagwan/fzf-lua' },
  { src = 'https://github.com/nvim-tree/nvim-tree.lua' },
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
  { src = 'https://github.com/lewis6991/gitsigns.nvim' },
  { src = 'https://github.com/stevearc/conform.nvim' },
  { src = 'https://github.com/stevearc/oil.nvim' }
}

-- vim.api.nvim_create_autocmd('InsertEnter', {
--   once = true,
--   callback = function()
--     vim.pack.add({ 'https://github.com/zbirenbaum/copilot.lua' })
--     require('copilot').setup({
--       panel = { enabled = false },
--       suggestion = {
--         enabled = true,
--         auto_trigger = true
--       }
--     })
--   end
-- })

vim.api.nvim_create_autocmd('BufReadPre', {
  once = true,
  callback = function()
    vim.pack.add({ 'https://github.com/folke/flash.nvim' })
    require('flash').setup({})
    local set = vim.keymap.set

    set({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "Flash" })
    set({ "n", "x", "o" }, "S", function() require("flash").treesitter() end, { desc = "Flash Treesitter" })
    set("o", "r", function() require("flash").remote() end, { desc = "Remote Flash" })
    set({ "o", "x" }, "R", function() require("flash").treesitter_search() end, { desc = "Treesitter Search" })
    set("c", "<c-s>", function() require("flash").toggle() end, { desc = "Toggle Flash Search" })
  end
})

vim.lsp.enable({ "clangd", "lua_ls", "gopls", "rust_analyzer", "intelephense", "oxfmt", "ts_ls" })

local map = vim.keymap.set

---------------------------       Oil       ---------------------------
require("oil").setup({
  default_file_explorer = true,
  view_options = {
    show_hidden = true,
  },
  delete_to_trash = true,
  float = {
    padding = 4,
    max_width = 0.8,
    max_height = 0,
  },
})
map("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

---------------------------     NvimTree    ---------------------------
require("nvim-tree").setup()
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "NeoTreeToggle" })

require('mini.pairs').setup()

---------------------------     FzfLua      ---------------------------
require("fzf-lua").setup {
  file_ignore_patterns = { "node_modules", "vendor", ".git" },
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

---------------------------     Conform      ---------------------------
require('conform').setup {
  formatters_by_ft = {
    ["*"] = { "trim_whitespace" },
    lua = { "stylua" },
    typescript = { "oxfmt" }
  }
}
