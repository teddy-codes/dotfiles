-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- Editor behavior
opt.relativenumber = true
opt.number = true
opt.clipboard = "unnamedplus"
opt.conceallevel = 0 -- Show markdown markup, useful for terraform/yaml files
opt.linebreak = true
opt.wrap = false

-- Indentation (important for YAML)
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- File handling
opt.backup = false
opt.swapfile = false
opt.undofile = true
opt.updatetime = 250
opt.timeoutlen = 300

-- UI improvements
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.pumheight = 10

opt.listchars = { tab = "→ ", trail = "·", eol = "↵" }
