return
{
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ft = { "typescriptreact", "html", "javascriptreact", "blade", "svelte", "kdl" },
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
    config = function()
      local highlight = {
        "CursorColumn",
        "Whitespace",
      }
      require("ibl").setup {
        indent = { highlight = highlight, char = "" },
        whitespace = {
          highlight = highlight,
          remove_blankline_trail = false,
        },
        scope = { enabled = false },
      }
    end
  },

  {
    'norcalli/nvim-colorizer.lua',
    cmd = "ColorizerToggle",
    -- event = "VeryLazy",
    opts = {}
  },

  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" }
  },

  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        section_separators = '',
        component_separators = '',
        globalstatus = true,
      }
    }
  },

  {
    "goolord/alpha-nvim",
    -- dependencies = { 'nvim-mini/mini.icons' },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local startify = require("alpha.themes.startify")
      -- available: devicons, mini, default is mini
      -- if provider not loaded and enabled is true, it will try to use another provider
      startify.file_icons.provider = "devicons"
      require("alpha").setup(
        require 'alpha.themes.dashboard'.config
      )
    end,
  },

  -- {
  --     'b0o/incline.nvim',
  --     config = function()
  --         local helpers = require 'incline.helpers'
  --         local devicons = require 'nvim-web-devicons'
  --         require('incline').setup {
  --             window = {
  --                 padding = 0,
  --                 margin = { horizontal = 0 },
  --             },
  --             render = function(props)
  --                 local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
  --                 if filename == '' then
  --                     filename = '[No Name]'
  --                 end
  --                 local ft_icon, ft_color = devicons.get_icon_color(filename)
  --                 local modified = vim.bo[props.buf].modified
  --                 return {
  --                     ft_icon and { ' ', ft_icon, ' ', guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or
  --                     '',
  --                     ' ',
  --                     { filename, gui = modified and 'bold,italic' or 'bold' },
  --                     ' ',
  --                     -- guibg = '#44406e',
  --                 }
  --             end,
  --         }
  --     end,
  --     -- Optional: Lazy load Incline
  --     event = 'VeryLazy',
  -- },
}
