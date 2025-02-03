return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "vim",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "yaml",
        "css",
        "html",
        "python",
        "go",
        "rust",
        "markdown",
        "markdown_inline",
      },
      highlight = {
        enable = true,
      },
      rainbow = {
        enable = true,
      },
    },
  },
}
