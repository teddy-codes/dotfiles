return {
  "goolord/alpha-nvim",
  opts = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Custom header with ASCII teddy bear

    dashboard.section.header.val = { "" }

    dashboard.section.header.opts.hl = "String"

    -- Custom buttons
    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
      dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
      dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
      dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
      dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
      dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
    }

    -- Footer with fortune cookie style messages
    local function footer()
      local teddy_quotes = {
        "ʕ•ᴥ•ʔ Remember to take coding breaks!",
        "ʕ•ᴥ•ʔ Clean code is happy code",
        "ʕ•ᴥ•ʔ You're doing great!",
        "ʕ•ᴥ•ʔ Time to debug with teddy",
        "ʕ•ᴥ•ʔ Keep calm and code on",
      }
      return teddy_quotes[math.random(#teddy_quotes)]
    end

    dashboard.section.footer.val = footer()
    dashboard.section.footer.opts.hl = "Type"

    -- Layout
    dashboard.config.layout = {
      { type = "padding", val = 2 },
      dashboard.section.header,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
      { type = "padding", val = 1 },
      dashboard.section.footer,
    }

    alpha.setup(dashboard.config)

    -- Set up autocmd to automatically show dashboard when opening Neovim
    return dashboard.config
  end,
}
