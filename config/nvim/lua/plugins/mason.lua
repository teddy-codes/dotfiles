return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        -- Terraform tools
        "terraform-ls",
        "tflint",
        "tfsec",

        -- Go tools
        "gopls",
        "goimports",
        "gofumpt",
        "gomodifytags",
        "impl",
        "golangci-lint",
        "delve", -- Go debugger

        -- TypeScript/JavaScript tools
        "typescript-language-server",
        "prettier",
        "eslint_d",

        -- YAML/Kubernetes tools
        "yaml-language-server",
        "yamllint",
        "helm-ls",

        -- General development tools
        "docker-compose-language-service",
        "dockerfile-language-server",
        "bash-language-server",
        "shellcheck",
        "shfmt",
      })
      return opts
    end,
  },
}
