return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-file-browser.nvim",
    },
    opts = {
      pickeers = {
        find_files = {
          hidden = true,
        },
      },
      defaults = {
        file_ignore_patterns = { "node_modules", ".git/", "dist/" },
        layout_strategy = "vertical",
        layout_config = {
          vertical = {
            width = 0.8,
            height = 0.9,
            preview_cutoff = 40,
            prompt_position = "top",
          },
        },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>", desc = "Find all files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
      { "<leader>fb", "<cmd>Telescope file_browser<cr>", desc = "File browser" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
    },
  },
}
