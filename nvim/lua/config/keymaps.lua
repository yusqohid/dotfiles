local keymap = vim.keymap

-- === General ===
keymap.set("n", "<leader>w", "<cmd>write<CR>", { desc = "Write Buffer" })
keymap.set("n", "<leader>q", "<cmd>quit<CR>", { desc = "Quit" })
keymap.set("n", "<leader>z", "<cmd>Lazy<CR>", { desc = "Lazy Dashboard" })
keymap.set("i", "jk", "<Esc>", { desc = "Exit Insert Mode" })
keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

-- === Terminal ===
keymap.set("n", "<leader>t", "<cmd>terminal<CR>i", { desc = "Terminal Float/Current" })
keymap.set("n", "<leader>tv", "<cmd>vsplit | terminal<CR>i", { desc = "Terminal Vertical" })
keymap.set("n", "<leader>th", "<cmd>split | terminal<CR>i", { desc = "Terminal Horizontal" })
-- Terminal navigation
keymap.set("t", "<C-h>", "<cmd>wincmd h<CR>")
keymap.set("t", "<C-j>", "<cmd>wincmd j<CR>")
keymap.set("t", "<C-k>", "<cmd>wincmd k<CR>")
keymap.set("t", "<C-l>", "<cmd>wincmd l<CR>")

-- === Window Management ===
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go Left" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go Down" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go Up" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go Right" })

-- Resize Window
keymap.set("n", "<C-Up>", "<cmd>resize +2<CR>")
keymap.set("n", "<C-Down>", "<cmd>resize -2<CR>")
keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>")
keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>")

-- === Editing ===
-- Move Lines (Alt + j/k) - Standard ThePrimeagen maps
keymap.set("n", "<A-j>", "<cmd>m .+1<CR>==", { desc = "Move line down" })
keymap.set("n", "<A-k>", "<cmd>m .-2<CR>==", { desc = "Move line up" })
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Better Indent
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Find and Replace
keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Replace word under cursor" })

-- === Clipboard ===
-- Copy
keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system" })
keymap.set("n", "<leader>yy", [["+yy]], { desc = "Yank line to system" })
keymap.set("n", "<leader>Y", [["+y$]], { desc = "Yank to EOL to system" })
-- Paste
keymap.set({ "n", "v" }, "<leader>p", [["+p]], { desc = "Paste from system" })
keymap.set("n", "<leader>P", [["+P]], { desc = "Paste before from system" })
-- Smart Paste (Don't overwrite register)
keymap.set("x", "p", '"_dP', { desc = "Paste without overwriting" })
-- Void Delete
keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete to void" })
keymap.set({ "n", "v" }, "<leader>dd", [["_dd]], { desc = "Delete line to void" })

-- === Buffer Navigation ===
keymap.set("n", "<leader><Tab>", "<cmd>bnext<CR>", { desc = "Next Buffer", silent = true })
keymap.set("n", "<leader><S-Tab>", "<cmd>bprev<CR>", { desc = "Prev Buffer", silent = true })
keymap.set("n", "<leader>x", "<cmd>bdelete<CR>", { desc = "Close Buffer" }) -- Ganti ke mini.bufremove jika perlu
