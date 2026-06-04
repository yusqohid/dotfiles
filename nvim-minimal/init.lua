vim.g.mapleader = " "
vim.g.maplocalleader = " "

local o = vim.opt

-- Indentation
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
o.expandtab = true
o.smartindent = true
o.autoindent = true

o.showtabline = 2

-- Search
o.ignorecase = true -- ignore case in search patterns
o.smartcase = true  -- override ignorecase if search has capital letter
o.incsearch = true  -- incremental search
o.hlsearch = true

-- Line Number
o.number = true
o.relativenumber = true

-- UI
o.cursorline = true
o.guicursor = ""
o.wrap = false
o.laststatus = 3 -- global statusline
-- o.fillchars:append({ eob = " " })

-- Clipboard
-- o.clipboard:append("unnamedplus")

-- Undo
o.undofile = true
o.undodir = vim.fn.stdpath("state") .. "/undo"

-- File Handling
o.swapfile = false
o.backup = false
o.autoread = true

-- Fold
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldlevel = 99

-- Spell Checking
o.spelllang = { "en" }
vim.keymap.set("n", "<leader>c", "1z=")
o.dictionary:append("/usr/share/dict/words")

-- Explorer
-- vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 25

vim.diagnostic.config({
  virtual_liens = true,
  underline = true
})

-- Autocomplete
o.complete = ".,o"                             -- use buffer and omnifunc
o.completeopt = "fuzzy,menuone,noinsert,popup" -- add 'popup' for docs (sometimes)
o.autocomplete = true
o.pumheight = 7

-- Others
o.termguicolors = true
o.scrolloff = 8
o.sidescrolloff = 4
o.encoding = "utf-8"
o.mouse = "a"
o.showmatch = true
o.undofile = true
o.signcolumn = "yes"
o.winborder = "rounded"
o.timeoutlen = 500
o.splitbelow = true
o.splitright = true
local keymap = vim.keymap
local map = keymap.set

-- === General ===
map("n", "<leader>w", "<cmd>write<CR>", { desc = "Write Buffer" })
map("n", "<leader>q", "<cmd>quit<CR>", { desc = "Quit" })
map("n", "<leader>a", "<cmd>e $MYVIMRC<CR>", { desc = "Edit Config File" })
map("n", "<leader>r", ":source $MYVIMRC <CR>")
map("n", "<leader>rs", ":restart<CR>")
map("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "New Tab" })
map("i", "jk", "<Esc>", { desc = "Exit Insert Mode" })
map("n", "-", "<CMD>Explore<CR>", { desc = "Open parent directory" })
map("n", "<leader>cd", "<cmd>lcd %:p:h<cr><cmd>pwd<cr>", {
  desc = "Change Directory to current file"
})
-- map("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Open File Tree" })

-- === Terminal ===
map("n", "<leader>t", "<cmd>terminal<CR>i", { desc = "Terminal Float/Current" })
map("n", "<leader>tv", "<cmd>vsplit | terminal<CR>i", { desc = "Terminal Vertical" })
map("n", "<leader>th", "<cmd>split | terminal<CR>i", { desc = "Terminal Horizontal" })
-- Terminal navigation
map("t", "<C-h>", "<cmd>wincmd h<CR>")
map("t", "<C-j>", "<cmd>wincmd j<CR>")
map("t", "<C-k>", "<cmd>wincmd k<CR>")
map("t", "<C-l>", "<cmd>wincmd l<CR>")

-- === Window Management ===
map("n", "<C-h>", "<C-w>h", { desc = "Go Left" })
map("n", "<C-j>", "<C-w>j", { desc = "Go Down" })
map("n", "<C-k>", "<C-w>k", { desc = "Go Up" })
map("n", "<C-l>", "<C-w>l", { desc = "Go Right" })

-- Resize Window
map("n", "<C-Up>", "<cmd>resize +2<CR>")
map("n", "<C-Down>", "<cmd>resize -2<CR>")
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>")
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>")

-- === Editing ===
-- Move Lines (Alt + j/k)
map("n", "<A-j>", "<cmd>m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", "<cmd>m .-2<CR>==", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Find and Replace
map("n", "<leader>rp", ":%s/\\<<C-r><C-w>\\>/", { desc = "Replace word under cursor" })

-- Completion
map('i', '<c-space>', function()
  vim.lsp.completion.get()
end)

-- Better Indent
map("v", "<", "<gv")
map("v", ">", ">gv")

map("n", "<Esc><Esc>", "<cmd>nohlsearch<CR>", { silent = true })

-- === Clipboard ===
-- Copy
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system" })
map("n", "<leader>yy", [["+yy]], { desc = "Yank line to system" })
map("n", "<leader>Y", [["+y$]], { desc = "Yank to EOL to system" })
-- Paste
map({ "n", "v" }, "<leader>p", [["+p]], { desc = "Paste from system" })
map("n", "<leader>P", [["+P]], { desc = "Paste before from system" })
-- Smart Paste (Don't overwrite register)
map("x", "p", '"_dP', { desc = "Paste without overwriting" })
-- Void Delete
map({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete to void" })
map({ "n", "v" }, "<leader>dd", [["_dd]], { desc = "Delete line to void" })

-- === Buffer Navigation ===
map("n", "<leader><Tab>", "<cmd>bnext<CR>", { desc = "Next Buffer", silent = true })
map("n", "<leader><S-Tab>", "<cmd>bprev<CR>", { desc = "Prev Buffer", silent = true })
map("n", "<leader>x", "<cmd>bdelete<CR>", { desc = "Close Buffer" }) -- Ganti ke mini.bufremove jika perlu

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Highlight on yank
augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
    group = "YankHighlight",
    callback = function()
        vim.highlight.on_yank { higroup = "IncSearch", timeout = "500" }
    end,
})

-- Remove whitespace on save
autocmd("BufWritePre", {
    pattern = "*",
    command = ":%s/\\s\\+$//e",
})

-- Don't auto commenting new lines
-- autocmd("BufEnter", {
--     pattern = "",
--     command = "set fo-=c fo-=r fo-=o",
-- })

-- Indenting autocmd
autocmd("FileType", {
    pattern = { "typescriptreact", "javascriptreact", "typescript", "javascript", "c" },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
    end,
})

-- LSP onAttach
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
    callback = function(ev)
        local bufnr = ev.buf
        local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
        -- Disable LSP Semantic Highlight
        if client then
            client.server_capabilities.semanticTokensProvider = nil
        end

        -- Autocomplete
        local function map(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = "LSP: " .. desc })
        end
        --------------------------------------------------------------------------------

        -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
        if client:supports_method('textDocument/completion') then
          -- Optional: trigger autocompletion on EVERY keypress. May be slow!
          -- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
          -- client.server_capabilities.completionProvider.triggerCharacters = chars

          vim.lsp.completion.enable(true, client.id, ev.buf, {autotrigger = true})
        end

        -- 1. Navigation
        map("n", "gd", vim.lsp.buf.definition, "Go to definition")
        map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
        map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
        map("n", "gr", vim.lsp.buf.references, "Show references")

        -- 2. Information
        map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
        map("n", "<leader>ls", vim.lsp.buf.signature_help, "Signature Help")

        -- 3. Actions
        map("n", "<leader>la", vim.lsp.buf.code_action, "Code Action")
        map("n", "<leader>lr", vim.lsp.buf.rename, "Rename Symbol")

        -- 4. Diagnostics
        map("n", "<leader>ld", vim.diagnostic.open_float, "Line Diagnostics")
        map("n", "[d", vim.diagnostic.goto_prev, "Prev Diagnostic")
        map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")

        -- 5. Formatting
        map("n", "<leader>lf", function()
            vim.lsp.buf.format { async = true }
        end, "Format Buffer")

        -- 6. Inlay Hints (Toggle)
        if client and client.server_capabilities.inlayHintProvider then
            map("n", "<leader>lh", function()
                local current = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
                vim.lsp.inlay_hint.enable(not current, { bufnr = bufnr })
            end, "Toggle Inlay Hints")
        end
    end,
})

-- Laravel blade sytax highlight
autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.blade.php",
  callback = function()
    vim.bo.filetype = "html"
  end,
})

vim.pack.add {
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  -- { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
  { src = 'https://github.com/nvim-mini/mini.pairs' },
  { src = 'https://github.com/ibhagwan/fzf-lua' },
  { src = 'https://github.com/stevearc/oil.nvim' },
  { src = 'https://github.com/nvim-tree/nvim-tree.lua' },
  -- { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
  { src = 'https://github.com/lewis6991/gitsigns.nvim' }
}

vim.lsp.enable({ "clangd", "lua_ls", "gopls", "rust_analyzer", "intelephense", "oxfmt" })

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

-- vim.cmd("colorscheme retrobox")
-- vim.cmd("colorscheme catppuccin")
-- vim.cmd("hi StatusLine guibg=NONE ctermbg=NONE")
-- vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#444444", bg = "none" })

