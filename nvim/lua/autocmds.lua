require "nvchad.autocmds"

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

-- LSP onAttach
autocmd("LspAttach", {
    group = augroup("UserLspConfig", { clear = true }),
    callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        local map = vim.keymap.set

        -- 2. Information & Documentation
        map("n", "<leader>ls", vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "Signature Help" })

        -- 3. Actions (Rename, Code Action)
        map("n", "<leader>la", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "Code Action" })
        map("n", "<leader>lr", vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename Symbol" })

        -- 4. Diagnostics
        map("n", "<leader>ld", vim.diagnostic.open_float, { buffer = ev.buf, desc = "Line Diagnostics" })

        -- 6. Inlay Hints
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client and client.server_capabilities.inlayHintProvider then
            map("n", "<leader>lh", function()
                local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = ev.buf })
                vim.lsp.inlay_hint.enable(not enabled, { bufnr = ev.buf })
            end, { buffer = ev.buf, desc = "Toggle Inlay Hints" })
        end
    end,
})

autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local line = vim.fn.line "'\""
    if
      line > 1
      and line <= vim.fn.line "$"
      and vim.bo.filetype ~= "commit"
      and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
    then
      vim.cmd 'normal! g`"'
    end
  end,
})
