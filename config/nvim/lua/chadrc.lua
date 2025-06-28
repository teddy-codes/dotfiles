-- -- This file needs to have same structure as nvconfig.lua
-- -- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- -- Please read that file to know all available options :(
--
-- ---@type ChadrcConfig
-- local M = {}
--
-- M.base46 = {
--   theme = "gruvchad",
--   -- theme = "doomchad",
-- }
--
-- -- M.nvdash = { load_on_startup = true }
-- M.ui = {}
-- --
-- M.ui = {
--   -- theme = "onedark", -- Modern dark theme with good TypeScript support
--   theme = "gruvchad",
--
--   -- Change this to match your preferences
--   transparency = true,
--
--   -- Terminal settings
--   term = {
--     float = {
--       border = "rounded",
--     },
--   },
--
--   -- NvDash (startup screen)
--   nvdash = {
--     load_on_startup = true,
--     header = {
--       "   TypeScript Development   ",
--       "                            ",
--       "                            ",
--       "                            ",
--     },
--   },
--
--   tabufline = {
--     lazyload = false,
--   },
--
--   -- Statusline config
--   statusline = {
--     theme = "default", -- or "vscode", "minimal", "evil"
--     separator_style = "default", -- or "round", "block", "arrow"
--     overriden_modules = nil,
--   },
--
--   -- Tabufline (top buffer/tab line)
--   tabufline = {
--     enabled = true,
--     lazyload = true,
--   },
--
--   -- Notifications
--   notifications = {
--     enabled = true,
--   },
--
--   -- Syntax highlighting
--   hl_override = {
--     -- Customize specific highlight groups here
--     Comment = { italic = true },
--     ["@parameter"] = { italic = true },
--     ["@type"] = { bold = true },
--   },
--
--   -- Icons for LSP diagnostics
--   lsp = {
--     diagnostics = {
--       signs = {
--         active = true,
--         values = {
--           { name = "DiagnosticSignError", text = "" },
--           { name = "DiagnosticSignWarn", text = "" },
--           { name = "DiagnosticSignHint", text = "" },
--           { name = "DiagnosticSignInfo", text = "" },
--         },
--       },
--       virtual_text = {
--         prefix = "●",
--         spacing = 4,
--       },
--     },
--   },
--
--   -- File explorer settings
--   nvimtree = {
--     git = {
--       enable = true,
--     },
--     renderer = {
--       highlight_git = true,
--       icons = {
--         show = {
--           git = true,
--         },
--       },
--     },
--   },
-- }
--
-- return M

-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

-- Theme configuration
M.base46 = {
  theme = "gruvchad", -- Use gruvchad as your primary theme
  -- hl_override = {
  --   Comment = { italic = true },
  --   ["@parameter"] = { italic = true },
  --   ["@type"] = { bold = true },
  -- },
  -- hl_add = {
  --   NvimTreeOpenedFolderName = { fg = "green", bold = true },
  -- }
}

-- UI configuration
M.ui = {
  cmp = {
    icons_left = true, -- only for non-atom styles!
    lspkind_text = true,
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
    format_colors = {
      tailwind = false,
      icon = "󱓻",
    },
  },

  telescope = {
    style = "borderless", -- borderless / bordered
  },

  statusline = {
    enabled = true,
    theme = "default", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "default",
    order = nil,
    modules = nil,
  },

  -- lazyload it when there are 1+ buffers
  tabufline = {
    enabled = true,
    lazyload = true, -- Better performance
    order = { "treeOffset", "buffers", "tabs", "btns" },
    modules = nil,
  },
}

-- Dashboard configuration
-- M.nvdash = {
--   load_on_startup = true, -- Enable dashboard on startup
--
--   header = {
--     "                            ",
--     "   ╭──────────────────────╮   ",
--     "   │  TypeScript Dev Setup │   ",
--     "   ╰──────────────────────╯   ",
--     "                            ",
--     "   Fast • Efficient • Modern ",
--     "                            ",
--   },
--
--   buttons = {
--     { txt = "  Find File", keys = "Spc f f", cmd = "Telescope find_files" },
--     { txt = "  Recent Files", keys = "Spc f o", cmd = "Telescope oldfiles" },
--     { txt = "󰈭  Find Word", keys = "Spc f w", cmd = "Telescope live_grep" },
--     { txt = "󱥚  Themes", keys = "Spc t h", cmd = ":lua require('nvchad.themes').open()" },
--     { txt = "  Mappings", keys = "Spc c h", cmd = "NvCheatsheet" },
--
--     { txt = "─", hl = "NvDashLazy", no_gap = true, rep = true },
--
--     {
--       txt = function()
--         local stats = require("lazy").stats()
--         local ms = math.floor(stats.startuptime) .. " ms"
--         return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
--       end,
--       hl = "NvDashLazy",
--       no_gap = true,
--     },
--
--     { txt = "─", hl = "NvDashLazy", no_gap = true, rep = true },
--   },
-- }

-- Terminal configuration
M.term = {
  winopts = { number = false, relativenumber = false },
  sizes = { sp = 0.3, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
  float = {
    relative = "editor",
    row = 0.3,
    col = 0.25,
    width = 0.5,
    height = 0.4,
    border = "single",
  },
}

-- Color scheme overrides
M.base46.hl_override = {
  Comment = { italic = true },
  ["@parameter"] = { italic = true },
  ["@type"] = { bold = true },
  ["@keyword"] = { italic = true },
  ["@function"] = { bold = true },

  -- Better TypeScript/JavaScript highlighting
  ["@typescript"] = { fg = "blue" },
  ["@javascript"] = { fg = "yellow" },
  ["@tsx"] = { fg = "cyan" },
  ["@jsx"] = { fg = "cyan" },
}

-- Additional highlight groups
M.base46.hl_add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
  NvimTreeGitDirty = { fg = "red" },
  NvimTreeGitNew = { fg = "green" },
  NvimTreeGitDeleted = { fg = "red" },
}

return M
