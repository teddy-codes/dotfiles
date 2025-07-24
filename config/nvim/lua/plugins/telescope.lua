return {
  -- Enhanced Telescope with ripgrep optimization
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    opts = {
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden", -- Search hidden files
          "--glob=!.git/", -- Exclude .git directory
          "--glob=!node_modules/",
          "--glob=!.terraform/",
          "--glob=!*.tfstate*",
          "--glob=!*.tfplan",
          "--glob=!dist/",
          "--glob=!build/",
        },
        file_ignore_patterns = {
          "node_modules",
          ".terraform",
          ".git/",
          "*.tfstate",
          "*.tfstate.backup",
          "*.tfplan",
          "dist/",
          "build/",
          "*.log",
          "*.cache",
        },
        mappings = {
          i = {
            ["<C-u>"] = false,
            ["<C-d>"] = false,
          },
        },
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        sorting_strategy = "ascending",
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        use_less = true,
        path_display = { "truncate" },
        set_env = { ["COLORTERM"] = "truecolor" },
      },
      pickers = {
        find_files = {
          find_command = {
            "rg",
            "--files",
            "--hidden",
            "--glob=!.git/",
            "--glob=!node_modules/",
            "--glob=!.terraform/",
            "--glob=!*.tfstate*",
            "--glob=!dist/",
            "--glob=!build/",
          },
        },
        live_grep = {
          additional_args = function()
            return { "--hidden", "--glob=!.git/" }
          end,
        },
        grep_string = {
          additional_args = function()
            return { "--hidden", "--glob=!.git/" }
          end,
        },
      },
    },
  },
}
