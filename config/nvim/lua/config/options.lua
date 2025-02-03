-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.conceallevel = 0
vim.opt.showmatch = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
vim.opt.incsearch = true
vim.opt.clipboard = "unnamedplus"
vim.opt.iskeyword:append("-")
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = "a"
vim.opt.guifont = "MonaspaceNFM:h13,JetBrainsMono Nerd Font:h13,Symbols Nerd Font:h13"
vim.g.have_nerd_font = true
vim.g.skip_ts_context_commentstring_module = true
vim.opt.list = true
vim.opt.listchars = { tab = "→ ", trail = "·" }
vim.opt.colorcolumn = "80,120"
vim.opt.showmode = false
