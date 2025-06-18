-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "monekai",
  -- theme = "doomchad",
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--   tabufline = {
--     lazyload = false,
--   },
-- }
--
M.ui = {
  -- theme = "onedark", -- Modern dark theme with good TypeScript support
  theme = "monekai",

  -- Change this to match your preferences
  transparency = false,

  -- Terminal settings
  term = {
    float = {
      border = "rounded",
    },
  },

  -- NvDash (startup screen)
  nvdash = {
    load_on_startup = true,
    header = {
      "   TypeScript Development   ",
      "                            ",
      "                            ",
      "                            ",
    },
  },

  -- Statusline config
  statusline = {
    theme = "default", -- or "vscode", "minimal", "evil"
    separator_style = "default", -- or "round", "block", "arrow"
    overriden_modules = nil,
  },

  -- Tabufline (top buffer/tab line)
  tabufline = {
    enabled = true,
    lazyload = true,
  },

  -- Notifications
  notifications = {
    enabled = true,
  },

  -- Syntax highlighting
  hl_override = {
    -- Customize specific highlight groups here
    Comment = { italic = true },
    ["@parameter"] = { italic = true },
    ["@type"] = { bold = true },
  },

  -- Icons for LSP diagnostics
  lsp = {
    diagnostics = {
      signs = {
        active = true,
        values = {
          { name = "DiagnosticSignError", text = "" },
          { name = "DiagnosticSignWarn", text = "" },
          { name = "DiagnosticSignHint", text = "" },
          { name = "DiagnosticSignInfo", text = "" },
        },
      },
      virtual_text = {
        prefix = "●",
        spacing = 4,
      },
    },
  },

  -- File explorer settings
  nvimtree = {
    git = {
      enable = true,
    },
    renderer = {
      highlight_git = true,
      icons = {
        show = {
          git = true,
        },
      },
    },
  },
}

return M
