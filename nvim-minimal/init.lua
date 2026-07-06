vim.g.mapleader = " "
vim.g.maplocalleader = " "

local o = vim.opt

-- Indentation
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.expandtab = true
o.smartindent = true
o.autoindent = true

o.showtabline = 1

-- Search
o.ignorecase = true -- ignore case in search patterns
o.wildignorecase = true
o.smartcase = true  -- override ignorecase if search has capital letter
o.incsearch = true  -- incremental search
o.hlsearch = true

-- Line Number
o.number = true
o.relativenumber = true

-- UI
-- o.cursorline = true
o.guicursor = ""
o.wrap = false
o.sidescroll=5
o.listchars:append("precedes:<,extends:>")
o.laststatus = 3 -- global statusline
-- Clipboard
-- o.clipboard:append("unnamedplus")

-- Undo
o.undofile = true
o.undodir = vim.fn.stdpath("state") .. "/undo"

-- File Handling
o.swapfile = false
o.backup = false

-- Fold
o.foldmethod = "indent"
o.foldlevel = 99

-- Spell Checking
o.spelllang = { "en" }
o.dictionary:append("/usr/share/dict/words")

-- Others
o.termguicolors = true
o.guifont = "DejaVu Sans Mono:h16"
o.scrolloff = 8
o.sidescrolloff = 4
o.showmatch = true
o.signcolumn = "yes"
o.winborder = "rounded"
o.timeoutlen = 500
o.splitbelow = true
o.splitright = true
o.makeprg = "cc % -o %<"
o.confirm = true
o.path:append("**")

-- Autocomplete
o.autocomplete = true
o.complete = ".,o"                             -- use buffer and omnifunc
o.completeopt = "fuzzy,menu,noselect,popup" -- add 'popup' for docs (sometimes)
o.pumheight = 7
o.pummaxwidth = 70
-- o.pumborder = "single"

-- vim.diagnostic.config({
--   virtual_liens = true,
--   underline = true
-- })

local map = vim.keymap.set

-- === General ===
map("n", "-",           "<cmd>Oil<CR>", { desc = "Open parent directory" })
map("n", "<leader>w",   "<cmd>write<CR>", { desc = "Write Buffer" })
map("n", "<leader>q",   "<cmd>quit<CR>", { desc = "Quit" })
map("n", "<leader>a",   "<cmd>edit $MYVIMRC<CR>", { desc = "Edit Config File" })
map("n", "<leader>r",   "<cmd>source $MYVIMRC <CR>", {desc = "Reload Config File"})
map("n", "<leader>rs",  "<cmd>restart<CR>",{desc = "Restart Neovim"})
map("n", "<leader>gg",  "<cmd>Neogit<CR>", {desc = "Open Neogit"})
map("n", "<leader>co",  "<cmd>copen<CR>", {desc = "Copen"})
map("n", "<leader>cd",  "<cmd>lcd %:p:h<cr><cmd>pwd<cr>", {
    desc = "Change Directory to current file"
})
-- map("i", "jk", "<Esc>", { desc = "Exit Insert Mode" })
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
map("t", "<C-q>", [[<C-\><C-n>]])

map("i", "<C-f>", "<Right>")
map("i", "<C-b>", "<Left>")

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

-- Better Indent
map("v", "<", "<gv")
map("v", ">", ">gv")

map("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true })

-- === Clipboard ===
-- Copy
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system" })
map("n", "yy", [["+yy]], { desc = "Yank line to system" })
map("n", "Y", [["+y$]], { desc = "Yank to EOL to system" })
-- Paste
map({ "n", "v" }, "<leader>p", [["+p]], { desc = "Paste from system" })
map("n", "<leader>P", [["+P]], { desc = "Paste before from system" })
-- Smart Paste (Don't overwrite register)
map("x", "p", '"_dP', { desc = "Paste without overwriting" })
-- Void Delete
map({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete to void" })
map({ "n", "v" }, "<leader>dd", [["_dd]], { desc = "Delete line to void" })

-- === Buffer Navigation ===
map("n", "<leader><Right>", "<cmd>bnext<CR>", { desc = "Next Buffer", silent = true })
map("n", "<leader><Left>", "<cmd>bprev<CR>", { desc = "Prev Buffer", silent = true })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Close Buffer" })

-- === Tab Navigation ===
map("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "New Tab" })

-- Compile command
map("n", "<F5>", function()
    vim.cmd("write")

    local file = vim.fn.expand("%")
    local output = vim.fn.expand("%:r")

    vim.cmd("!" ..
        "cc " .. file ..
        " -o " .. output ..
        " && ./" .. output)
end)
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

-- Indenting autocmd
autocmd("FileType", {
    pattern = { "typescriptreact", "javascriptreact", "typescript", "javascript" },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
    end,
})

-- LSP onAttach
autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
    callback = function(ev)
        local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
        if not client then return end

        -- Disable LSP Semantic Highlight
        client.server_capabilities.semanticTokensProvider = nil

        -- Autocomplete, Helper function untuk keymaps
        local opts = { buffer = ev.buf, silent = true }
        local function keymap(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", opts, { desc = "LSP: " .. desc }))
        end

        -- Enable auto-completion.
        if client:supports_method('textDocument/completion') then
          vim.lsp.completion.enable(true, client.id, ev.buf, {autotrigger = true})
        end

        keymap("n", "<CR>", vim.diagnostic.open_float, "Line Diagnostics")
        keymap('i', '<C-Space>', function() vim.lsp.completion.get() end, "Get Completion")

        -- 5. Formatting
        keymap("n", "<leader>lf", function()
            vim.lsp.buf.format { async = true }
        end, "Format Buffer")

    end,
})

-- Laravel blade sytax highlight
autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.blade.php",
    callback = function()
        vim.bo.filetype = "html"
    end,
})

vim.pack.add({
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/stevearc/oil.nvim',
    'https://github.com/ibhagwan/fzf-lua',
    'https://github.com/nvim-tree/nvim-tree.lua',
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/lewis6991/gitsigns.nvim',
    -- 'https://github.com/rachartier/tiny-cmdline.nvim',
    'https://github.com/folke/which-key.nvim',
    'https://github.com/nvim-mini/mini.nvim',
    'https://github.com/NeogitOrg/neogit',
    'https://github.com/metalelf0/black-metal-theme-neovim',
    'https://github.com/nvim-lualine/lualine.nvim',
    'https://github.com/vague-theme/vague.nvim',
})

---------------------------   LSP Config   ---------------------------
vim.lsp.enable({
    "clangd",
    "ts_ls",
    "lua_ls",
    "gopls",
    "rust_analyzer",
    "intelephense",
    "oxfmt"
})
vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                },
            },
        },
    },
})

---------------------------   Tiny CMDline   ---------------------------
-- vim.o.cmdheight = 0
-- require("vim._core.ui2").enable({})
-- require("tiny-cmdline").setup()

---------------------------    File Manager   --------------------------
require('oil').setup({
    delete_to_trash = true,
    columns = {
        "icon",
        "permissions",
        "size",
        "mtime",
    },
})
-- require("nvim-tree").setup()
-- map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "NeoTreeToggle" })

---------------------------     Mini.nvim    ---------------------------
require('mini.pairs').setup()
require('mini.surround').setup()
require('lualine').setup {
    options = { section_separators = '', component_separators = '' }
}

---------------------------     FzfLua      ---------------------------
require("fzf-lua").setup({})
map("n", "<leader><leader>", "<cmd>FzfLua files<CR>", { desc = "Pick Files" })
map("n", "<leader>bb", "<cmd>FzfLua buffers<CR>", { desc = "Pick Buffers" })
map("n", "<leader>fr", "<cmd>FzfLua oldfiles<CR>", { desc = "Pick Oldfiles" })
map("n", "<leader>ft", "<cmd>FzfLua tabs<CR>", { desc = "Pick Tabs" })
map("n", "<leader>fg", "<cmd>FzfLua live_grep<CR>", { desc = "Live Grep" })
map("n", "<leader>fm", "<cmd>FzfLua manpages<CR>", { desc = "Pick Man Pages" })
map("n", "gs", "<cmd>FzfLua lsp_document_symbols<CR>", { desc = "Pick Document Symbol" })

-- require("black-metal").setup({})
-- require("black-metal").load()
-- vim.cmd("colorscheme bathory")
require('vague').setup({
  transparent = false, -- If true, background is not set
  bold = false, -- Disable bold globally
  italic = false, -- Disable italic globally
})
vim.cmd("colorscheme vague")
-- vim.cmd("colorscheme catppuccin")
-- vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
-- vim.cmd("hi SignColumn guibg=NONE ctermbg=NONE")
-- vim.cmd("hi StatusLine guibg=NONE ctermbg=NONE")
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#1c1c1c", bg = "NONE" })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#1c1c1c", bg = "NONE", })
-- vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE", })
