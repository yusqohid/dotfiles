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
