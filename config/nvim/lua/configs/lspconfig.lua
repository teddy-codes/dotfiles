-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")

local servers = {
  "html",
  "cssls",
  "vtsls",
  "eslint",
  "jsonls",
  "bashls",
  "dockerls",
  "gopls",
  "pyright",
  "rust_analyzer",
  "tflint",
}
local nvlsp = require("nvchad.configs.lspconfig")

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  })
end

lspconfig.terraformls.setup({
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  init_options = {
    useLanguageServerProxy = true,
  },
  filetypes = { "tf", "tfstate", "terraform-vars" },
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.tf" },
  callback = function()
    vim.lsp.buf.format()
  end,
})
