return {
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   priority = 1000,
  --   opts = {
  --     flavour = "mocha", -- latte, frappe, macchiato, mocha
  --     background = { -- :h background
  --       light = "latte",
  --       dark = "mocha",
  --     },
  --     transparent_background = false,
  --     show_end_of_buffer = false,
  --     integrations = {
  --       aerial = true,
  --       alpha = true,
  --       cmp = true,
  --       dashboard = true,
  --       flash = true,
  --       gitsigns = true,
  --       headlines = true,
  --       illuminate = true,
  --       indent_blankline = { enabled = true },
  --       leap = true,
  --       lsp_trouble = true,
  --       mason = true,
  --       markdown = true,
  --       mini = true,
  --       native_lsp = {
  --         enabled = true,
  --         underlines = {
  --           errors = { "undercurl" },
  --           hints = { "undercurl" },
  --           warnings = { "undercurl" },
  --           information = { "undercurl" },
  --         },
  --       },
  --       navic = { enabled = true, custom_bg = "NONE" },
  --       neotest = true,
  --       neotree = true,
  --       noice = true,
  --       notify = true,
  --       semantic_tokens = true,
  --       telescope = true,
  --       treesitter = true,
  --       which_key = true,
  --     },
  --   },
  -- },
  --
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000, -- Make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called
    config = function()
      require("everforest").setup({
        -- Controls the "hardness" of the background color
        -- Options: "soft", "medium", "hard"
        background = "medium",
        -- How much of the background should be transparent (useful for terminals with transparency)
        -- 0 = fully opaque, 100 = fully transparent
        transparent_background_level = 0,
        -- Whether italics should be used for keywords, comments, etc.
        italics = true,
        -- Disable italic fonts for comments
        disable_italic_comments = false,
        -- Set to true to use the neutral palette in non-UI modes
        ui_contrast = false,
        -- Dim inactive windows
        dim_inactive_windows = false,
        -- Set custom colors if needed (see documentation for more options)
        -- colours_override = {},
        -- Styles to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        styles = {
          -- Style for comments
          comments = { "italic" },
          -- Style for functions
          functions = { "bold" },
          -- Style for keywords
          keywords = {},
          -- Style for strings
          strings = {},
          -- Style for variables
          variables = {},
        },
        -- Override default colors based on Neovim mode
        -- Will be applied on top of the chosen palette
        -- See examples in documentation
        -- highlights = {},
      })
      -- Set colorscheme after options
      vim.cmd("colorscheme everforest")
    end,
  },
  -- {
  --   "rebelot/kanagawa.nvim",
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     -- load the colorscheme here
  --     vim.cmd([[colorscheme kanagawa]])
  --   end,
  -- },

  -- Set as default colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "everforest",
    },
  },
}
