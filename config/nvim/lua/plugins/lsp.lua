return {
  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Mason for LSP server management
      {
        "williamboman/mason.nvim",
        config = function()
          require("mason").setup {
            ui = {
              icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗",
              },
            },
          }
        end,
      },
      -- Bridge between Mason and LSP Config
      {
        "williamboman/mason-lspconfig.nvim",
        config = function()
          require("mason-lspconfig").setup {
            ensure_installed = {
              "vtsls", -- TypeScript language server
              "eslint", -- ESLint server
              "gopls", -- Go language server
              "lua_ls", -- Lua language server
              "cssls", -- CSS language server
              "html", -- HTML language server
            },
            automatic_installation = true,
          }
        end,
      },
      -- Tool installer plugin
      {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        config = function()
          require("mason-tool-installer").setup {
            ensure_installed = {
              -- Formatters
              "prettier",
              "stylua",
              "gofumpt",
              "goimports",
              "shfmt",

              -- DAP
              "delve",
              "js-debug-adapter",
            },
            auto_update = true,
            run_on_start = true,
          }
        end,
      },
    },
    config = function()
      local lspconfig = require "lspconfig"

      -- TypeScript configuration
      lspconfig.vtsls.setup {
        init_options = {
          preferences = {
            importModuleSpecifierPreference = "relative",
            importModuleSpecifierEnding = "minimal",
          },
        },
        on_attach = function(client, bufnr)
          -- Disable formatting for tsserver (use Prettier instead)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
      }

      -- ESLint configuration
      lspconfig.eslint.setup {
        on_attach = function(_, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
      }

      -- Go language server configuration
      lspconfig.gopls.setup {
        cmd = { "gopls" },
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
          },
        },
      }
    end,
  },

  -- Formatting with Conform
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        -- Optional mapping to trigger format
        "<leader>cf",
        function()
          require("conform").format { async = true, lsp_fallback = true }
        end,
        mode = { "n", "v" },
        desc = "Format buffer",
      },
    },
    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        vue = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        less = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        ["markdown.mdx"] = { "prettier" },
        graphql = { "prettier" },
        handlebars = { "prettier" },
        go = { "gofmt" },
      },
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },
  },
}
