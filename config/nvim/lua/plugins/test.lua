return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "haydenmeade/neotest-jest",
      "marilari88/neotest-vitest",
      "nvim-neotest/neotest-go",
    },
    config = function()
      require("neotest").setup({
        -- General configuration
        adapters = {
          require("neotest-jest")({
            jestCommand = "npm test --",
            env = { CI = true },
            cwd = function()
              return vim.fn.getcwd()
            end,
          }),
          require("neotest-go")({       -- Pass an options table to neotest-go
            args = { "-v" },            -- Add some basic options
            experimental = {
              test_table = true,
            },
            recursive_run = true,
          }),
        },
        icons = {
          failed = "✖",
          passed = "✓",
          running = "⟳",
          skipped = "ↅ",
        },
        output = {
          output = true,
          open_on_run = true,
        },
        summary = {
          enabled = true,
          expand_errors = true,
          follow = true,
        },
      })

    end,
    keys = function()
      -- Only define keymaps after the plugin has been loaded
      local neotest_loaded, neotest = pcall(require, "neotest")
      if not neotest_loaded then
        return {}
      end
      return {
        {
          "<leader>tl",
          function() neotest.run.run_last() end,
          desc = "Run Last Test",
        },
        {
          "<leader>tL",
          function() neotest.run.run_last({ strategy = "dap" }) end,
          desc = "Debug Last Test",
        },
        {
          "<leader>tw",
          function() neotest.run.run({ jestCommand = 'npm test -- --watch' }) end,
          desc = "Run Watch",
        },
        {
          "<leader>tt",
          function() neotest.run.run() end,
          desc = "Run Nearest Test",
        },
        {
          "<leader>tT",
          function() neotest.run.run({strategy = "dap"}) end,
          desc = "Debug Nearest Test",
        },
        {
          "<leader>ts",
          function() neotest.summary.toggle() end,
          desc = "Toggle Summary",
        },
        {
          "<leader>to",
          function() neotest.output.open({ enter = true }) end,
          desc = "Show Output",
        },
      }
    end,
    init = function()
      -- Create a user command that will load the plugin first
      vim.api.nvim_create_user_command("Neotest", function(opts)
        require("neotest")
        vim.cmd.redraw()
        vim.cmd("echo 'Neotest loaded'")
      end, {})
    end,
  },
}
