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
o.complete = "o"                             -- use buffer and omnifunc
o.completeopt = "fuzzy,menuone,noselect,popup" -- add 'popup' for docs (sometimes)
o.autocomplete = true
o.pumheight = 7
o.pummaxwidth = 40
o.autocompletedelay = 300

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
