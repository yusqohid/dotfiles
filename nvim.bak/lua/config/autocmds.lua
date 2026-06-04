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

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("NativeLSPCompletion", { clear = true }),
  callback = function(args)
    local client_id = args.data.client_id
    local client = vim.lsp.get_client_by_id(client_id)

    -- Pastikan LSP mendukung fitur autocompletion
    if client and client:supports_method("textDocument/completion") then
      -- Aktifkan autocompletion bawaan Neovim dengan fitur autotrigger
      vim.lsp.completion.enable(true, client_id, args.buf, { autotrigger = true })
    end
  end,
})
