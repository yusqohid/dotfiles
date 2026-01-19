return {

    -- {
    --     "sainnhe/gruvbox-material",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         vim.g.gruvbox_material_background = "hard" -- bisa: hard, medium, soft
    --         vim.g.gruvbox_material_foreground = "material" -- atau: mix, original, material
    --         vim.g.gruvbox_material_enable_italic = false
    --         vim.g.gruvbox_material_transparent_background = 1
    --         vim.cmd("colorscheme gruvbox-material")
    --     end,
    -- },

    -- {
    --   "folke/tokyonight.nvim",
    --   lazy = false,
    --   priority = 1000,
    --   opts = {},
    --   config = function()
    --     require('tokyonight').setup({
    --       transparent = true,
    --     })
    --     vim.cmd('colorscheme tokyonight')
    --     vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "NONE" })
    --     vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "NONE" })
    --     vim.api.nvim_set_hl(0, "NvimTreeVertSplit", { bg = "NONE" })
    --     vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = "NONE" })
    --     vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { bg = "NONE" })
    --     vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
    --     vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
    --     vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
    --     vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
    --     vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
    --   end
    -- },

    -- {
    --   "olimorris/onedarkpro.nvim",
    --   priority = 1000,
    --   lazy = false,
    --   config = function()
    --     require("onedarkpro").setup({
    --       options = {
    --         transparency = true,
    --       }
    --     })
    --     vim.cmd('colorscheme onedark')
    --   end,
    -- },

    -- {
    --   "vague2k/vague.nvim",
    --   priority = 1000,
    --   lazy = false,
    --   config = function()
    --     require("vague").setup({
    --       transparent = true,
    --       italic = false,
    --       bold = false
    --     })
    --     vim.cmd('colorscheme vague')
    --     -- Transparent background
    --     vim.cmd [[
    --   hi Normal guibg=NONE ctermbg=NONE
    --   hi NormalNC guibg=NONE ctermbg=NONE
    --   hi EndOfBuffer guibg=NONE ctermbg=NONE
    --   hi LineNr guibg=NONE ctermbg=NONE
    --   hi SignColumn guibg=NONE ctermbg=NONE
    --   hi StatusLine guibg=NONE ctermbg=NONE
    -- ]]
    --   end
    -- },


    -- {
    --   "rose-pine/neovim",
    --   name = "rose-pine",
    --   config = function()
    --     require('rose-pine').setup({
    --       styles = {
    --         transparency = true
    --       }
    --     })
    --     vim.cmd("colorscheme rose-pine")
    --   end
    -- }

    {
        "scottmckendry/cyberdream.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("cyberdream").setup({
                transparent = true,
            })
            vim.cmd("colorscheme cyberdream")
        end
    }

    -- {
    --   "kdheepak/monochrome.nvim",
    --   config = function()
    --     vim.cmd("colorscheme monochrome")
    --     vim.cmd [[
    --   hi Normal guibg=NONE ctermbg=NONE
    --   hi NormalNC guibg=NONE ctermbg=NONE
    --   hi EndOfBuffer guibg=NONE ctermbg=NONE
    --   hi LineNr guibg=NONE ctermbg=NONE
    --   hi SignColumn guibg=NONE ctermbg=NONE
    --   hi StatusLine guibg=NONE ctermbg=NONE
    --     ]]
    --   end
    -- }

    -- {
    --     "rebelot/kanagawa.nvim",
    --     config = function()
    --         require('kanagawa').setup({
    --             transparent = true, -- do not set background color
    --             commentStyle = { italic = false },
    --             keywordStyle = { italic = false },
    --             statementStyle = { bold = false },
    --         })
    --         vim.cmd('colorscheme kanagawa-wave')
    --         vim.cmd [[
    --   hi Normal guibg=NONE ctermbg=NONE
    --   hi NormalNC guibg=NONE ctermbg=NONE
    --   hi EndOfBuffer guibg=NONE ctermbg=NONE
    --   hi LineNr guibg=NONE ctermbg=NONE
    --   hi SignColumn guibg=NONE ctermbg=NONE
    --   hi StatusLine guibg=NONE ctermbg=NONE
    --     ]]
    --     end
    -- }

    -- {
    --   "metalelf0/black-metal-theme-neovim",
    --   lazy = false,
    --   priority = 1000,
    --   config = function()
    --     require("black-metal").setup({
    --       -- optional configuration here
    --       -- theme = "darkthrone"
    --       theme = "khold"
    --     })
    --     require("black-metal").load()
    --   end,
    -- }

    -- {
    --     "catppuccin/nvim",
    --     name = "catppuccin",
    --     priority = 1000,
    --     config = function()
    --         require('catppuccin').setup({
    --             transparent_background = true,
    --         })
    --         vim.cmd.colorscheme("catppuccin")
    --     end
    -- }

}
