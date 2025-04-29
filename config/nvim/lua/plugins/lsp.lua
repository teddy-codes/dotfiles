return {
  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Mason for LSP server management
      {
        "williamboman/mason.nvim",
        config = function()
          require("mason").setup({
            ui = {
              icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗",
              },
            },
          })
        end,
      },
      -- Bridge between Mason and LSP Config
      {
        "williamboman/mason-lspconfig.nvim",
        config = function()
          require("mason-lspconfig").setup({
            ensure_installed = {
              "vtsls", -- TypeScript language server
              "eslint", -- ESLint server
              "gopls", -- Go language server
              "lua_ls", -- Lua language server
              "cssls", -- CSS language server
              "html", -- HTML language server
              "jsonls", -- JSON language
              "bashls", -- Bash language server
              "dockerls", -- Docker language server
              "terraformls", -- Terraform language server
              "pyright", -- Python language server
              "rust_analyzer", -- Rust language server
              "graphql", -- GraphQL language server
              "yamlls", -- YAML language server
              "taplo", -- TOML language server
              "marksman", -- Markdown language server
            },
            automatic_installation = true,
          })
        end,
      },
      -- Tool installer plugin
      {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        config = function()
          require("mason-tool-installer").setup({
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
          })
        end,
      },
    },
    config = function()
      local lspconfig = require("lspconfig")

      -- TypeScript configuration
      lspconfig.vtsls.setup({
        init_options = {
          preferences = {
            importModuleSpecifierPreference = "relative",
            importModuleSpecifierEnding = "minimal",
          },
        },

        settings = {
          typescript = {
            inlayHints = {
              parameterNames = { enabled = "all" },
              parameterTypes = { enabled = true },
              variableTypes = { enabled = true },
              propertyDeclarationTypes = { enabled = true },
              functionLikeReturnTypes = { enabled = true },
              enumMemberValues = { enabled = true },
            },
          },
          javascript = {
            inlayHints = {
              parameterNames = { enabled = "all" },
              parameterTypes = { enabled = true },
              variableTypes = { enabled = true },
              propertyDeclarationTypes = { enabled = true },
              functionLikeReturnTypes = { enabled = true },
              enumMemberValues = { enabled = true },
            },
          },
          vtsls = {
            -- This setting helps prevent excessively long inlay hints
            experimental = {
              maxInlayHintLength = 30,
            },
          },
        },

        on_attach = function(client, bufnr)
          -- Disable formatting for tsserver (use Prettier instead)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
      })

      -- ESLint configuration
      lspconfig.eslint.setup({
        on_attach = function(_, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
      })

      -- Go language server configuration
      lspconfig.gopls.setup({
        cmd = { "gopls" },
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
          },
        },
      })

      lspconfig.terraformls.setup({
        filetypes = { "terraform", "terraform-vars", "tf" },
      })
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
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = { "n", "v" },
        desc = "Format buffer",
      },
    },
    opts = {
      icons = {
        diagnostics = true,
        references = true,
      },
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
  -- Trouble.nvim configuration
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "Trouble",
    opts = {},
    keys = {
      { "<leader>xx", "<cmd>Trouble<cr>", desc = "Toggle Diagnostics" },
      { "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", desc = "Document Diagnostics" },
      { "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
      { "<leader>xq", "<cmd>Trouble quickfix<cr>", desc = "Quickfix List" },
      { "<leader>xl", "<cmd>Trouble loclist<cr>", desc = "Location List" },
      { "gR", "<cmd>Trouble lsp_references<cr>", desc = "LSP References" },
    },
  },
}
