return
{
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    -- Plugin hanya akan dimuat saat Anda menekan tombol-tombol di bawah ini
    keys = {
        { "<up>",          function() require("multicursor-nvim").lineAddCursor(-1) end, mode = { "n", "x" }, desc = "Add cursor above" },
        { "<down>",        function() require("multicursor-nvim").lineAddCursor(1) end,  mode = { "n", "x" }, desc = "Add cursor below" },
        { "<leader>n",     function() require("multicursor-nvim").matchAddCursor(1) end, mode = { "n", "x" }, desc = "Match next word" },
        { "<c-q>",         function() require("multicursor-nvim").toggleCursor() end,    mode = { "n", "x" }, desc = "Toggle cursor" },
        { "<c-leftmouse>", function() require("multicursor-nvim").handleMouse() end,     mode = "n",          desc = "Mouse cursor" },
    },
    config = function()
        local mc = require("multicursor-nvim")
        mc.setup()

        -- 1. Setup Highlight (Warna Kursor)
        local hl = vim.api.nvim_set_hl
        hl(0, "MultiCursorCursor", { reverse = true })
        hl(0, "MultiCursorVisual", { link = "Visual" })
        hl(0, "MultiCursorSign", { link = "SignColumn" })
        hl(0, "MultiCursorDisabledCursor", { reverse = true })

        -- 2. Setup Keymap Layer
        mc.addKeymapLayer(function(layerSet)
            layerSet({ "n", "x" }, "<left>", mc.prevCursor)
            layerSet({ "n", "x" }, "<right>", mc.nextCursor)
            layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor)

            -- Esc cerdas: Jika ada banyak kursor, hapus kursornya.
            -- Jika sudah tinggal satu, kembali ke Normal mode biasa.
            layerSet("n", "<esc>", function()
                if not mc.cursorsEnabled() then
                    mc.enableCursors()
                else
                    mc.clearCursors()
                end
            end)
        end)
    end
}
